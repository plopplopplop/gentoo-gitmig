# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

inherit kde4-base

DESCRIPTION="A Gentoo system management tool"
HOMEPAGE="http://www.binro.org"
SRC_URI="http://binro.org/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="
	$(add_kdebase_dep konsole)
"
RDEPEND="${DEPEND}"
