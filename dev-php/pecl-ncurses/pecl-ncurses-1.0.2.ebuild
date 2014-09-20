# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

USE_PHP="php5-3 php5-4 php5-5"

inherit php-ext-pecl-r2

DESCRIPTION="Terminal screen handling and optimization package"

LICENSE="PHP-3.01"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"

my_conf="--enable-ncursesw"
