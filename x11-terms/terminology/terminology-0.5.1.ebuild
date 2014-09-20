# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-terms/terminology/terminology-0.5.1.ebuild,v 1.1 2014/06/30 16:42:58 sera Exp $

EAPI=5

DESCRIPTION="Feature rich terminal emulator using the Enlightenment Foundation Libraries"
HOMEPAGE="http://www.enlightenment.org/p.php?p=about/terminology"
SRC_URI="http://download.enlightenment.org/rel/apps/${PN}/${P}.tar.bz2"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-libs/efl-1.8.1
	>=media-libs/elementary-1.8.0"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
