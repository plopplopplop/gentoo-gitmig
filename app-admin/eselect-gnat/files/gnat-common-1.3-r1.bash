# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

#
# Original Author: George Shapovalov <george@gentoo.org>
# Purpose: Contains common vars/locations and functions for use by gnat.eclass,
# gnat.eselect and gnatbuild.eclass.
#
# NOTE!!!
# This code should just define vars (try to limit these!) and simple functions.
# No bash extensions!!
# That is, no portage or eclass constructs are allowed!
#



# ----------------------------------
# Globals

# Environmantal stuff (for env update)
SPECSDIR="/usr/share/gnat/eselect"
ENVDIR="/etc/env.d"
MARKER="55gnat-"

# User configurable settings
SETTINGSDIR="/etc/ada"
PRIMELIST="${SETTINGSDIR}/primary_compilers"

## Lib install locations
##
## Gnat profile dependent files go under under ${LibTop}/${Gnat_Profile}/${PN}
## and common files go unde SpecsDir, DataDir
#PREFIX=/usr
## Replace %LIBDIR% below with $(get_libdir) in eclasses and ebuilds (top level Ok, inherit multilib)
## or $(profile2libdir ${profile}) in this code, eselect module or anywhere
## outside portage (as profile will be available only during actual execution, this only should 
## be done inside corresponding functions).
#AdalibSpecsDir=${PREFIX}/include/ada
#AdalibDataDir=${PREFIX}/share/ada
#AdalibLibTop=${PREFIX}/%LIBDIR%/ada


# ------------------------------------
# Helpers
#

# get_all_profile_components splits gnat profile and returns pace separated list of its components:
# x86_64-pc-linux-gnu-gnat-gcc-4.1  -> x86_64-pc-linux-gnu gcc 4.1
# args:
#  $1 - the string to split
get_all_profile_components() {
	local GnatSLOT=${1##*-}
	local remainder=${1%-*}
	local GnatPkg=${remainder##*-}
	remainder=${remainder%-gnat-*}
	echo "${remainder} ${GnatPkg} ${GnatSLOT}"
}

# similar to above, returns only SLOT component:
# x86_64-pc-linux-gnu-gnat-gcc-4.1  -> 4.1
# args:
#  $1 - the string to extract the slot from
get_gnat_SLOT() {
	echo "${1##*-}"
}

# returns only Pkg component:
# x86_64-pc-linux-gnu-gnat-gcc-4.1  -> gcc
# args:
#  $1 - the string to extract the slot from
get_gnat_Pkg() {
	local remainder=${1%-*}
	echo "${remainder##*-}"
}

# returns only Arch component:
# x86_64-pc-linux-gnu-gnat-gcc-4.1  -> x86_64-pc-linux-gnu
# args:
#  $1 - the string to extract the slot from
get_gnat_Arch() {
	echo ${1%-gnat-*}
}



## -------------------------------------------
#  gnat profile and lib detection functions


# create a list of all gnat env.d files
# for now use trivial implementation - store name of active profile in the
# env file name, so it gets called 55gnat-${ARCH}-${PN}-${SLOT}
get_env_list() {
	for fn in ${ENVDIR}/${MARKER}*; do
		echo $(basename ${fn})
	done
}



# find all installed compilers and return a list
find_all_compilers() {
	[[ ! -d ${SPECSDIR} ]] && exit
	for fn in ${SPECSDIR}/*; do
		[[ ! -d ${fn} ]] && echo $(basename ${fn});
	done
}

# find installed primary compilers and return a list
find_primary_compilers() {
	[[ ! -f ${PRIMELIST} ]] && exit
	for fn in $(cat ${PRIMELIST}); do
		[[ -f ${SPECSDIR}/${fn} ]] && echo ${fn};
	done
}

# find installed libs and return a list
find_all_libs() {
	[[ ! -d ${SPECSDIR} ]] && exit
	for fn in ${SPECSDIR}/*; do
		[[ -d ${fn} ]] && echo $(basename ${fn});
	done
}

# find libs that have been built for a given profile
# Arguments:
#  $1 - gnat profile for which to detect active libs
find_libs4profile() {
	libs=( $(find_all_libs) )

	for (( i = 0 ; i < ${#libs[@]} ; i = i + 1 )) ; do
		[[ -f ${SPECSDIR}/${libs[$i]}/$1 ]] && echo "${libs[$i]}"
	done
}




## -----------------------
#  main action - central part of do_set and helpers


# extracts values of the passed var definition from given spec file
# params:
# $1: spec file (as generated by gnabuild.eclass)
# $2: variable name
get_var_from_spec() {
	local var=$(grep -e "^ *$2=" $1|cut -d= -f2)
	echo ${var}
}


# Cycle through given libs and form a ':' separated list of settings for the given
# var. Returned string starts with ':' if there is any non-empty setting,
# otherwise returns empty string. Repeating settings are omitted, that is
# unique entry is added only first time it is encountered. No need to have some
# common dir listed many times in PATH for example.
#
# params:
#   $1 - name of env var to process
#   $2 - name of gnat profile
#   $3.. - list of libs to check (to avoid its composition every time)
#        - the list is expanded to list of args at the point of call
get_lib_var_settings() {
	local envVar=$1
	local toset=$2
	#echo "get_lib_var_settings params:$@" >> /tmp/eselect-gnat.rep
	if  [[ "none" != ${3} ]]; then
		local envString
		local specLine
		while [[ -n $3 ]]; do
			specLine=$(get_var_from_spec ${SPECSDIR}/$3/${toset} ${envVar})
			#echo "$3:${specLine}." >> /tmp/eselect-gnat.rep
			if [[ -n ${specLine} ]] && [[ ! ${envString} =~ ${specLine} ]]; then 
				envString="${envString}:${specLine}"
			fi
			shift
		done
		echo "${envString}"
	fi
}



# The action!
# Part common for do_set and do_update of gnat.eselect, also used in gnat.eclass
# to set environment during lib build and installation
#
# params:
#  $1 - profile to set (toset param inside)
#  $2 - envfile

generate_envFile() {
	local toset=$1
	local envfile=$2

	local binpath="$(get_var_from_spec ${SPECSDIR}/${toset} binpath)"
	local libexecpath="$(get_var_from_spec ${SPECSDIR}/${toset} libexecpath)"
	local libs=( $(find_libs4profile ${toset}) )
	#echo "generate_envFile: ${libs[@]}" >> /tmp/eselect-gnat.rep
	if (( 0 == ${#libs[@]} )); then
		libs="none"
	fi

	local MyPath="${binpath}:${libexecpath}$(get_lib_var_settings PATH ${toset} ${libs[@]})"
	echo "PATH=${MyPath}" > "${envfile}"
	echo "ROOTPATH=${MyPath}" >> "${envfile}"
	echo "MANPATH=$(get_var_from_spec ${SPECSDIR}/${toset} manpath)$(get_lib_var_settings MANPATH ${toset} ${libs[@]})" >> "${envfile}"
	echo "INFOPATH=$(get_var_from_spec ${SPECSDIR}/${toset} infopath)$(get_lib_var_settings INFOPATH ${toset} ${libs[@]})" >> "${envfile}"
	# the next three use the common base
	local libBase=$(get_var_from_spec ${SPECSDIR}/${toset} ldpath)
	echo "LDPATH=${libBase}:${libBase}/adalib$(get_lib_var_settings LDPATH ${toset} ${libs[@]})" >> "${envfile}"
	echo "ADA_INCLUDE_PATH=${libBase}/adainclude$(get_lib_var_settings ADA_INCLUDE_PATH ${toset} ${libs[@]})" >> "${envfile}"
	echo "ADA_OBJECTS_PATH=${libBase}/adalib$(get_lib_var_settings ADA_OBJECTS_PATH ${toset} ${libs[@]})" >> "${envfile}"
	# ADA_PROJECT_PATH may not be set in any of the installed packages,
	# we should only create this line if cumulative var is non-empty
	My_ProjectPath=$(get_lib_var_settings ADA_PROJECT_PATH ${toset} ${libs[@]})
	if [[ -n ${My_ProjectPath} ]]; then
		echo "ADA_PROJECT_PATH=${My_ProjectPath}" >> "${envfile}"
	fi
}

