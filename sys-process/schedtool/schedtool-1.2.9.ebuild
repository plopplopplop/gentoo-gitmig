# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

DESCRIPTION="A tool to query or alter a process' scheduling policy"
HOMEPAGE="http://freequaos.host.sk/schedtool"
SRC_URI="http://freequaos.host.sk/${PN}/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT=0
KEYWORDS="~amd64 ~mips ~ppc ~x86"
IUSE=""

src_unpack() {
	unpack ${A}
	cd ${S}
	sed -i '/^CFLAGS=/d' Makefile
}

src_compile() {
	emake || die "Compilation failed."
}

src_install() {
	make DESTPREFIX=${D}/usr install
	dodoc BUGS CHANGES INSTALL README THANKS TUNING
}
