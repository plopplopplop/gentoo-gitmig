# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php/PEAR-HTML_Template_Flexy/PEAR-HTML_Template_Flexy-1.3.9.ebuild,v 1.1 2009/08/26 20:57:49 beandog Exp $

inherit php-pear-r1

DESCRIPTION="An extremely powerful Tokenizer driven Template engine"
LICENSE="PHP-2.02"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="minimal"
RDEPEND="!minimal? ( >=dev-php/PEAR-HTML_Javascript-1.1.0-r1
	dev-php/PEAR-File_Gettext
	dev-php/PEAR-Translation2 )"
