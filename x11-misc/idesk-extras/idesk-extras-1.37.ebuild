# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=4

DESCRIPTION="Graphical configuration for iDesk plus icons"
HOMEPAGE="http://www.jmurray.id.au/idesk-extras.html" # dead?
SRC_URI="http://dev.gentoo.org/~hasufell/distfiles/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="app-shells/bash
	x11-misc/idesk
	x11-misc/xdialog"

src_install() {
	dobin idesktool
	dodoc CHANGES
	dohtml ${PN}.html

	insinto /usr/share/idesk
	doins -r icons
}
