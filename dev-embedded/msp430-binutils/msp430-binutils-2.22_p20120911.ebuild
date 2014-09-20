# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-embedded/msp430-binutils/msp430-binutils-2.22_p20120911.ebuild,v 1.1 2012/09/14 04:12:31 radhermit Exp $

PATCHVER="1.5"

BINUTILS_VER=${PV%_p*}

inherit toolchain-binutils

DESCRIPTION="Tools necessary to build programs for MSP430 microcontrollers"
SRC_URI+=" http://dev.gentoo.org/~radhermit/dist/${P}.patch.bz2"

KEYWORDS="~amd64 ~x86"

# needed to fix bug #381633
RDEPEND=">=sys-devel/binutils-config-3-r2"

pkg_setup() {
	is_cross || die "Only cross-compile builds are supported"
}

PATCHES=(
	"${WORKDIR}"/${P}.patch
)
