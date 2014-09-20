#!/usr/bin/env bash
# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

# Based on the am-wrapper.pl script provided by MandrakeSoft
# Rewritten in bash by Gregorio Guidi
#
# Executes the correct automake version.
#
# - defaults to newest version available (hopefully automake-1.10)
# - runs automake-1.9 if:
#   - envvar WANT_AUTOMAKE is set to `1.9'
#     -or-
#   - `Makefile.in' was generated by automake-1.9
#     -or-
#   - 'aclocal.m4' contain AM_AUTOMAKE_VERSION, specifying the use of 1.9
# - runs automake-1.8 if:
#   - envvar WANT_AUTOMAKE is set to `1.8'
#     -or-
#   - `Makefile.in' was generated by automake-1.8
#     -or-
#   - 'aclocal.m4' contain AM_AUTOMAKE_VERSION, specifying the use of 1.8
# - runs automake-1.7 if:
#   - envvar WANT_AUTOMAKE is set to `1.7'
#     -or-
#   - `Makefile.in' was generated by automake-1.7
#     -or-
#   - 'aclocal.m4' contain AM_AUTOMAKE_VERSION, specifying the use of 1.7
# - runs automake-1.6 if:
#   - envvar WANT_AUTOMAKE is set to `1.6'
#     -or-
#   - `Makefile.in'
#     -or-
#   - 'aclocal.m4' contain AM_AUTOMAKE_VERSION, specifying the use of 1.6
# - runs automake-1.5 if:
#   - envvar WANT_AUTOMAKE is set to `1.5'
#     -or-
#   - `Makefile.in' was generated by automake-1.5
#     -or-
#   - 'aclocal.m4' contain AM_AUTOMAKE_VERSION, specifying the use of 1.5
# - runs automake-1.4 if:
#   - envvar WANT_AUTOMAKE is set to `1.4'
#     -or-
#   - `Makefile.in' was generated by automake-1.4
#     -or-
#   - 'aclocal.m4' contain AM_AUTOMAKE_VERSION, specifying the use of 1.4

if [ "${0##*/}" = "am-wrapper.sh" ] ; then
	echo "Don't call this script directly." >&2
	exit 1
fi

vers="1.11 1.10 1.9 1.8 1.7 1.6 1.5 1.4"

#
# Export the proper variable/versions and try to locate a usuable
# default (newer versions are preferred)
#
binary=""
for v in ${vers} ; do
	eval binary_${v/./_}="${0}-${v}"

	if [ -z "${binary}" ] && [ -x "${0}-${v}" ] ; then
		binary="${0}-${v}"
	fi
done
if [ -z "${binary}" ] ; then
	echo "am-wrapper: Unable to locate any usuable version of automake." >&2
	echo "            I tried these versions: ${vers}" >&2
	echo "            With a base name of '${0}'." >&2
	exit 1
fi

#
# Check the WANT_AUTOMAKE setting.  We accept a whitespace delimited
# list of automake versions.
#
if [ -n "${WANT_AUTOMAKE}" ] ; then
	for v in ${vers} x ; do
		if [ "${v}" = "x" ] ; then
			echo "am-wrapper: warning: invalid WANT_AUTOMAKE '${WANT_AUTOMAKE}'; ignoring." >&2
			unset WANT_AUTOMAKE
			break
		fi

		for wx in ${WANT_AUTOMAKE} ; do
			if [ "${wx}" = "${v}" ] ; then
				binary="binary_${v/./_}"
				binary="${!binary}"
				v="x"
			fi
		done
		[ "${v}" = "x" ] && break
	done
fi

#
# autodetect helpers
#
do_awk() {
	local file=$1 ; shift
	local arg=$1 ; shift
	echo $(gawk "{ if (match(\$0, \"$*\", res)) { print res[${arg}]; exit } }" ${file})
}

#
# autodetect routine
#
if [ -z "${WANT_AUTOMAKE}" ] ; then
	if [ -r "Makefile.in" ] ; then
		confversion_mf=$(do_awk Makefile.in 2 "^# Makefile.in generated (automatically )?by automake ([0-9].[0-9]+)")
	fi
	if [ -r "aclocal.m4" ] ; then
		confversion_ac=$(do_awk aclocal.m4 1 'generated automatically by aclocal ([0-9].[0-9]+)')
		confversion_am=$(do_awk aclocal.m4 1 '[[:space:]]*\\[?AM_AUTOMAKE_VERSION\\(\\[?([0-9].[0-9]+)[^)]*\\]?\\)')
	fi

	for v in ${vers} ; do
		if [ "${confversion_mf}" = "${v}" ] \
		   || [ "${confversion_ac}" = "${v}" ] \
		   || [ "${confversion_am}" = "${v}" ] ; then
			binary="binary_${v/./_}"
			binary="${!binary}"
			break
		fi
	done
fi

if [ "${WANT_AMWRAPPER_DEBUG}" ] ; then
	if [ "${WANT_AUTOMAKE}" ] ; then
		echo "am-wrapper: DEBUG: WANT_AUTOMAKE is set to ${WANT_AUTOMAKE}" >&2
	fi
	echo "am-wrapper: DEBUG: will execute <$binary>" >&2
fi

#
# for further consistency
#
for v in ${vers} ; do
	mybin="binary_${v/./_}"
	if [ "${binary}" = "${!mybin}" ] ; then
		export WANT_AUTOMAKE="${v}"
	fi
done

#
# Now try to run the binary
#
if [ ! -x "${binary}" ] ; then
	echo "am-wrapper: $binary is missing or not executable." >&2
	echo "            Please try emerging the correct version of automake." >&2
	exit 1
fi

exec "$binary" "$@"

echo "am-wrapper: was unable to exec $binary !?" >&2
exit 1
