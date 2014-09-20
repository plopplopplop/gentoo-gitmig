# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="3"

inherit eutils

DESCRIPTION="A nice tool to manage amt-enabled machines"
HOMEPAGE="http://dl.bytesex.org/releases/amtterm/"
SRC_URI="http://dl.bytesex.org/releases/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux"
IUSE=""

RDEPEND="dev-perl/SOAP-Lite"

src_prepare() {
	sed -i -e 's|\(INSTALL_BINARY  := \$(INSTALL)\) \$(STRIP)|\1|' mk/Variables.mk || die
}

src_compile() {
	prefix="/usr" emake || die
}

src_install() {
	prefix="/usr" emake DESTDIR=${ED} install || die
}
