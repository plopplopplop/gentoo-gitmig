# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=4

MODULE_AUTHOR=MLEHMANN
MODULE_VERSION=2.33
inherit perl-module

DESCRIPTION="JSON::XS - JSON serialising/deserialising, done correctly and fast"

SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~x64-macos ~x86-solaris"
IUSE="test"

RDEPEND="dev-perl/common-sense"
DEPEND="${RDEPEND}
	test? ( virtual/perl-Test-Harness )"

SRC_TEST="do"
