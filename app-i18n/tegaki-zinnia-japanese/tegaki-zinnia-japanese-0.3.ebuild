# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-i18n/tegaki-zinnia-japanese/tegaki-zinnia-japanese-0.3.ebuild,v 1.1 2013/05/04 12:49:38 naota Exp $

EAPI=5

DESCRIPTION="Handwriting model data of Japanese"
HOMEPAGE="http://tegaki.org/"
SRC_URI="http://www.tegaki.org/releases/${PV}/models/${P}.zip"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	sed -i -e "/^installpath=/s:local/::" Makefile || die
	sed -i -e "/^installpath=/s:installpath=:installpath=${ED}:" Makefile || die
}

src_compile() {
	:
}
