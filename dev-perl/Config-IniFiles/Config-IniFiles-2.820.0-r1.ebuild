# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Config-IniFiles/Config-IniFiles-2.820.0-r1.ebuild,v 1.1 2014/08/23 21:51:08 axs Exp $

EAPI=5

MODULE_AUTHOR=SHLOMIF
MODULE_VERSION=2.82
inherit perl-module

DESCRIPTION="A module for reading .ini-style configuration files"

SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="test"

RDEPEND="
	dev-perl/IO-stringy
	dev-perl/List-MoreUtils
"
DEPEND="${RDEPEND}
	>=virtual/perl-Module-Build-0.36
	test? (
		dev-perl/Test-Pod
		dev-perl/Test-Pod-Coverage
	)
"

SRC_TEST="do"
