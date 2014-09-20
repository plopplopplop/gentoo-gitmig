# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kshisen/kshisen-4.12.5.ebuild,v 1.5 2014/05/08 07:32:31 ago Exp $

EAPI=5

KDE_HANDBOOK="optional"
KDE_SELINUX_MODULE="games"
inherit kde4-base

DESCRIPTION="A KDE game similiar to Mahjongg"
HOMEPAGE="
	http://www.kde.org/applications/games/kshisen/
	http://games.kde.org/game.php?game=kshisen
"
KEYWORDS="amd64 ~arm ppc ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	$(add_kdebase_dep libkdegames)
	$(add_kdebase_dep libkmahjongg)
"
RDEPEND="${DEPEND}"
