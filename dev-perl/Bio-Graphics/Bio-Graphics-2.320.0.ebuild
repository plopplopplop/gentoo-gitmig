# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=4

MODULE_AUTHOR=LDS
MODULE_VERSION=2.32
inherit perl-module

DESCRIPTION="Generate images from Bio::Seq objects for visualization purposes"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-perl/GD
	dev-perl/Statistics-Descriptive"
DEPEND="${RDEPEND}
	virtual/perl-Module-Build"

SRC_TEST=no
