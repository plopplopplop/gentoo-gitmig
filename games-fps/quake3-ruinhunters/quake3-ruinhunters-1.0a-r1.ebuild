# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=2

MOD_DESC="a anime/fantasy mod with cartoonish characters and arcade-like gameplay"
MOD_NAME="Ruin Hunters"
MOD_DIR="ruin"

inherit games games-mods

HOMEPAGE="http://planetquake.gamespy.com/View.php?view=Quake3.Detail&id=1824"
SRC_URI="mirror://gentoo/ruin_hunters_v10.zip
	mirror://gentoo/ruin_hunters_v10a_patch.zip
	http://www.mirrorservice.org/sites/www.ibiblio.org/gentoo/distfiles/ruin_hunters_v10a_patch.zip
	http://www.mirrorservice.org/sites/www.ibiblio.org/gentoo/distfiles/ruin_hunters_v10.zip"

LICENSE="freedist"
KEYWORDS="amd64 ~ppc x86"
IUSE="dedicated opengl"

src_unpack() {
	unpack ruin_hunters_{v10,v10a_patch}.zip
}

src_prepare() {
	rm -f *.bat
}
