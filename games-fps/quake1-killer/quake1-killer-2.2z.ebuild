# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-fps/quake1-killer/quake1-killer-2.2z.ebuild,v 1.6 2014/04/10 08:00:09 ulm Exp $

inherit games

DESCRIPTION="The Killer Quake Patch"
HOMEPAGE="http://kqp.horoy.com/"
SRC_URI="http://www.gamers.org/pub/idgames2/quakec/compilations/kqp220z.zip
	mirror://gentoo/kqp220z.zip"

LICENSE="quake1-killer"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND="app-arch/unzip"

S=${WORKDIR}

src_unpack() {
	echo ">>> Unpacking kqp220z.zip to ${PWD}"
	unzip -qoL "${DISTDIR}"/kqp220z.zip || die "unpacking kqp220z.zip failed"
}

src_install() {
	insinto "${GAMES_DATADIR}/quake1/killer"
	doins -r * || die
	prepgamesdirs
}
