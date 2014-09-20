# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

MODULE_AUTHOR=WYANT
MODULE_VERSION=0.003
inherit perl-module

DESCRIPTION="Manipulate Mac OS X clipboards/pasteboards"

SLOT="0"
KEYWORDS="~ppc-macos ~x64-macos ~x86-macos"
IUSE=""

DEPEND="
	virtual/perl-Module-Build
"
