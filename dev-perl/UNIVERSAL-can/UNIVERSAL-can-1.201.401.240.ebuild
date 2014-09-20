# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/UNIVERSAL-can/UNIVERSAL-can-1.201.401.240.ebuild,v 1.1 2014/02/15 03:19:39 radhermit Exp $

EAPI=5

MODULE_AUTHOR=CHROMATIC
MODULE_VERSION=1.20140124
inherit perl-module

DESCRIPTION="Hack around people calling UNIVERSAL::can() as a function"

SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~x86 ~ppc-aix"
IUSE="test"

RDEPEND="virtual/perl-Scalar-List-Utils"
DEPEND="
	test? (
		${RDEPEND}
		>=virtual/perl-Test-Simple-0.60
	)"

SRC_TEST="do"
