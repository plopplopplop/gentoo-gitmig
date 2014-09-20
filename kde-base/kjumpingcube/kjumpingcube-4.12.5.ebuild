# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kjumpingcube/kjumpingcube-4.12.5.ebuild,v 1.5 2014/05/08 07:32:44 ago Exp $

EAPI=5

KDE_HANDBOOK="optional"
KDE_SELINUX_MODULE="games"
inherit kde4-base

DESCRIPTION="KDE: Tactical one or two player game"
HOMEPAGE="
	http://www.kde.org/applications/games/kjumpingcube/
	http://games.kde.org/game.php?game=kjumpingcube
"
KEYWORDS="amd64 ~arm ppc ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="$(add_kdebase_dep libkdegames)"
RDEPEND="${DEPEND}"
