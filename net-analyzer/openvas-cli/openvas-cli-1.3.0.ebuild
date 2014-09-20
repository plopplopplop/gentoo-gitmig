# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/openvas-cli/openvas-cli-1.3.0.ebuild,v 1.1 2014/06/19 13:38:59 hanno Exp $

EAPI=5

inherit cmake-utils

DESCRIPTION="A remote security scanner for Linux (openvas-cli)"
HOMEPAGE="http://www.openvas.org/"
SRC_URI="http://wald.intevation.org/frs/download.php/1633/${P}.tar.gz"
SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~arm ~ppc ~x86"
IUSE=""

RDEPEND=">=net-analyzer/openvas-libraries-7.0.2
	!net-analyzer/openvas-client"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	dev-util/cmake"

src_configure() {
	local mycmakeargs="-DLOCALSTATEDIR=/var -DSYSCONFDIR=/etc"
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	dodoc ChangeLog CHANGES README || die "dodoc failed"
}
