# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=2
inherit eutils autotools games

DESCRIPTION="A game about an evil hacker called Bill!"
HOMEPAGE="http://www.xbill.org/"
SRC_URI="http://www.xbill.org/download/${P}.tar.gz"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="alpha amd64 ppc x86"
IUSE="gtk"

RDEPEND="gtk? ( x11-libs/gtk+:2 )
	!gtk? ( x11-libs/libXaw )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	epatch \
		"${FILESDIR}"/${P}-gtk2.patch \
		"${FILESDIR}"/${P}-gentoo.patch
	eautoreconf
}

src_configure() {
	egamesconf \
		--disable-motif \
		$(use_enable gtk) \
		$(use_enable !gtk athena)
}

src_install() {
	emake DESTDIR="${D}" install || die
	newicon pixmaps/icon.xpm ${PN}.xpm
	make_desktop_entry ${PN} XBill ${PN}
	dodoc ChangeLog README
	prepgamesdirs
}
