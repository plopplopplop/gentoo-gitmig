# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=2
inherit eutils qt4-r2 games

DESCRIPTION="Creates and manages configuration files for DOSBox"
HOMEPAGE="http://developer.berlios.de/projects/dboxfe/"
SRC_URI="mirror://berlios/dboxfe/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc x86"
IUSE=""

DEPEND="dev-qt/qtgui:4
	dev-qt/qtcore:4"
RDEPEND="${DEPEND}
	>=games-emulation/dosbox-0.65"

PATCHES=( "${FILESDIR}"/${P}-ldflags.patch )

src_configure() {
	qt4-r2_src_configure
}

src_install() {
	dogamesbin bin/dboxfe || die
	dodoc TODO ChangeLog
	newicon res/default.png ${PN}.png
	make_desktop_entry dboxfe "DosBoxFE"
	prepgamesdirs
}
