# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/perl-Filter-Simple/perl-Filter-Simple-0.890.0-r1.ebuild,v 1.4 2014/09/17 13:41:54 jer Exp $

EAPI=5

DESCRIPTION="Virtual for perl-core/Filter-Simple"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="alpha amd64 hppa ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	|| ( =dev-lang/perl-5.18* ~perl-core/${PN#perl-}-${PV} )
	!<perl-core/${PN#perl-}-${PV}
	!>perl-core/${PN#perl-}-${PV}-r999
"
