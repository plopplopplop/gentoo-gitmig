# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="3"
PHP_PEAR_CHANNEL="${FILESDIR}/channel.xml"
PHP_PEAR_PN="PHP_Depend"
inherit php-pear-lib-r1

DESCRIPTION="Static code analyser for PHP"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
HOMEPAGE="http://www.pdepend.org"

RDEPEND="${RDEPEND}
	>=dev-lang/php-5.2.3"
