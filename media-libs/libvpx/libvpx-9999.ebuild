# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libvpx/libvpx-9999.ebuild,v 1.48 2014/02/21 02:44:49 floppym Exp $

EAPI=4
inherit multilib toolchain-funcs multilib-minimal

LIBVPX_TESTDATA_VER=1.3.0

if [[ ${PV} == *9999* ]]; then
	inherit git-2
	EGIT_REPO_URI="https://chromium.googlesource.com/webm/${PN}.git"
elif [[ ${PV} == *pre* ]]; then
	SRC_URI="mirror://gentoo/${P}.tar.bz2"
	KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux"
else
	SRC_URI="http://webm.googlecode.com/files/${PN}-v${PV}.tar.bz2"
	KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux"
	S="${WORKDIR}/${PN}-v${PV}"
fi
# generated by: make LIBVPX_TEST_DATA_PATH=libvpx-testdata testdata + tar'ing
# it.
SRC_URI="${SRC_URI}
	test? ( mirror://gentoo/${PN}-testdata-${LIBVPX_TESTDATA_VER}.tar.bz2 )"

DESCRIPTION="WebM VP8 Codec SDK"
HOMEPAGE="http://www.webmproject.org"

LICENSE="BSD"
SLOT="0"
IUSE="altivec avx avx2 doc mmx postproc sse sse2 sse3 ssse3 sse4_1 static-libs test +threads"

RDEPEND="abi_x86_32? ( !app-emulation/emul-linux-x86-medialibs[-abi_x86_32(-)] )"
DEPEND="abi_x86_32? ( dev-lang/yasm )
	abi_x86_64? ( dev-lang/yasm )
	x86-fbsd? ( dev-lang/yasm )
	amd64-fbsd? ( dev-lang/yasm )
	doc? (
		app-doc/doxygen
		dev-lang/php
	)
"

REQUIRED_USE="
	sse? ( sse2 )
	sse2? ( mmx )
	ssse3? ( sse2 )
	"

multilib_src_configure() {
	unset CODECS #357487

	# let the build system decide which AS to use (it honours $AS but
	# then feeds it with yasm flags without checking...) #345161
	tc-export AS
	case "${CHOST}" in
		i?86*) export AS=yasm;;
		x86_64*) export AS=yasm;;
	esac

	# http://bugs.gentoo.org/show_bug.cgi?id=384585
	# https://bugs.gentoo.org/show_bug.cgi?id=465988
	# copied from php-pear-r1.eclass
	addpredict /usr/share/snmp/mibs/.index
	addpredict /var/lib/net-snmp/
	addpredict /var/lib/net-snmp/mib_indexes
	addpredict /session_mm_cli0.sem

	# Build with correct toolchain.
	tc-export CC CXX AR NM
	# Link with gcc by default, the build system should override this if needed.
	export LD="${CC}"

	local myconf
	if [ "${ABI}" = "${DEFAULT_ABI}" ] ; then
		myconf+=" $(use_enable doc install-docs) $(use_enable doc docs)"
	else
		# not needed for multilib and will be overwritten anyway.
		myconf+=" --disable-examples --disable-install-docs --disable-docs"
	fi

	"${S}/configure" \
		--prefix="${EPREFIX}"/usr \
		--libdir="${EPREFIX}"/usr/$(get_libdir) \
		--enable-pic \
		--enable-vp8 \
		--enable-shared \
		--extra-cflags="${CFLAGS}" \
		$(use_enable altivec) \
		$(use_enable avx) \
		$(use_enable avx2) \
		$(use_enable mmx) \
		$(use_enable postproc) \
		$(use_enable sse) \
		$(use_enable sse2) \
		$(use_enable sse3) \
		$(use_enable sse4_1) \
		$(use_enable ssse3) \
		$(use_enable static-libs static) \
		$(use_enable test unit-tests) \
		$(use_enable threads multithread) \
		${myconf} \
		|| die
}

multilib_src_compile() {
	# build verbose by default and do not build examples that will not be installed
	emake verbose=yes GEN_EXAMPLES=
}

multilib_src_test() {
	LD_LIBRARY_PATH="${BUILD_DIR}:${LD_LIBRARY_PATH}" \
		emake verbose=yes GEN_EXAMPLES=  LIBVPX_TEST_DATA_PATH="${WORKDIR}/${PN}-testdata" test
}

multilib_src_install() {
	emake verbose=yes GEN_EXAMPLES= DESTDIR="${D}" install
	[ "${ABI}" = "${DEFAULT_ABI}" ] && use doc && dohtml docs/html/*
}
