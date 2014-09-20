# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Olson-Abbreviations/Olson-Abbreviations-0.40.0.ebuild,v 1.1 2013/03/18 08:35:59 tove Exp $

EAPI=5

MODULE_AUTHOR=ECARROLL
MODULE_VERSION=0.04
inherit perl-module

DESCRIPTION="Globally unique timezones abbreviation handling"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-perl/Moose
	>=dev-perl/MooseX-ClassAttribute-0.250.0
	dev-perl/namespace-autoclean
"
DEPEND="${RDEPEND}
	test? (
		dev-perl/Test-Pod
		dev-perl/Test-Pod-Coverage
	)
"

SRC_TEST=do
