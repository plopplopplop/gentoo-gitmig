# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=4

MY_PN=txt2html
MODULE_AUTHOR=RUBYKAT
MODULE_VERSION=2.51
inherit perl-module

DESCRIPTION="HTML::TextToHTML - convert plain text file to HTML"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-perl/YAML-Syck
	virtual/perl-Getopt-Long
	dev-perl/Getopt-ArgvFile"
DEPEND="${RDEPEND}
	virtual/perl-Module-Build"

SRC_TEST="do"
