# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-arcade/defendguin/defendguin-0.0.12.ebuild,v 1.6 2012/09/05 07:13:37 mr_bones_ Exp $

EAPI=2
inherit eutils games

DESCRIPTION="A clone of the arcade game Defender, but with a Linux theme"
HOMEPAGE="http://www.newbreedsoftware.com/defendguin/"
SRC_URI="ftp://ftp.tuxpaint.org/unix/x/${PN}/src/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ~sparc x86 ~x86-fbsd"
IUSE=""

DEPEND="media-libs/sdl-mixer[mod]
	media-libs/libsdl[video]"

src_prepare() {
	sed -i \
		-e "s:\$(DATA_PREFIX):${GAMES_DATADIR}/${PN}/:" \
		-e '/^CFLAGS=.*-O2/d' \
		-e '/^CFLAGS=/s:=:+= $(LDFLAGS) :' \
		Makefile \
		|| die
	rm -f data/images/*.sh
}

src_install() {
	dogamesbin ${PN} || die
	insinto "${GAMES_DATADIR}"/${PN}
	doins -r ./data/* || die
	newicon data/images/ufo/ufo0.bmp ${PN}.bmp
	make_desktop_entry ${PN} Defendguin /usr/share/pixmaps/${PN}.bmp
	doman src/${PN}.6
	dodoc docs/{AUTHORS,CHANGES,README,TODO}.txt
	prepgamesdirs
}
