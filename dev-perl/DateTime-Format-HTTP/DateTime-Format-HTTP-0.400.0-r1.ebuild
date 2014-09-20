# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

MODULE_AUTHOR=CKRAS
MODULE_VERSION=0.40
inherit perl-module

DESCRIPTION="Date conversion routines"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	dev-perl/DateTime
	dev-perl/libwww-perl"
DEPEND="${RDEPEND}
	virtual/perl-Module-Build"

SRC_TEST=do
