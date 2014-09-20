# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kcalc/kcalc-4.12.5.ebuild,v 1.5 2014/05/08 07:32:27 ago Exp $

EAPI=5

KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="KDE calculator"
HOMEPAGE="http://www.kde.org/applications/utilities/kcalc
http://utils.kde.org/projects/kcalc"
KEYWORDS=" amd64 ~arm ppc ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	dev-libs/gmp
"
RDEPEND="${DEPEND}"
