# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-leechcraft/lc-lemon/lc-lemon-0.6.70.ebuild,v 1.1 2014/08/03 18:55:53 maksbotan Exp $

EAPI="4"

inherit leechcraft

DESCRIPTION="Network monitor plugin for LeechCraft"

SLOT="0"
KEYWORDS=" ~amd64 ~x86"
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}
	~virtual/leechcraft-quark-sideprovider-${PV}
	dev-qt/qtbearer:4
	dev-qt/qtdeclarative:4
	dev-libs/libnl:3
	x11-libs/qwt:6
	"
RDEPEND="${DEPEND}"
