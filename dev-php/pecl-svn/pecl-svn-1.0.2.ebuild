# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

PHP_EXT_NAME="svn"

USE_PHP="php5-3 php5-4 php5-5"

inherit php-ext-pecl-r2

KEYWORDS="~amd64 ~x86"

DESCRIPTION="PHP Bindings for the Subversion Revision control system"
LICENSE="PHP-3.01"
SLOT="0"
IUSE=""

DEPEND="dev-vcs/subversion"
RDEPEND="${DEPEND}"
