# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=2
inherit eutils toolchain-funcs

MY_P=GUIlib-${PV}

DESCRIPTION="a simple widget set for SDL"
SRC_URI="http://www.libsdl.org/projects/GUIlib/src/${MY_P}.tar.gz"
HOMEPAGE="http://www.libsdl.org/projects/GUIlib/"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="amd64 ~hppa ppc x86"
IUSE=""

RDEPEND=">=media-libs/libsdl-1.0.1"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${MY_P}

src_prepare() {
	epatch "${FILESDIR}"/${P}.makefile.patch \
		"${FILESDIR}"/${P}-gcc-4.1.x-fix.diff
}

src_configure() {
	tc-export CC CXX LD
	econf
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc CHANGES README
}
