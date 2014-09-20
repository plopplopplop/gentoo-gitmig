# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Package-Stash-XS/Package-Stash-XS-0.260.0.ebuild,v 1.13 2014/02/01 23:57:49 vapier Exp $

EAPI=5

MODULE_AUTHOR=DOY
MODULE_VERSION=0.26
inherit perl-module

DESCRIPTION="Faster and more correct implementation of the Package::Stash API"

SLOT="0"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 m68k ppc ppc64 s390 sh sparc x86 ~ppc-aix ~x86-fbsd ~x86-freebsd ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	>=virtual/perl-ExtUtils-MakeMaker-6.310.0
	test? (
		dev-perl/Test-Fatal
		dev-perl/Test-Requires
		>=virtual/perl-Test-Simple-0.880.0
	)"

SRC_TEST="do"
