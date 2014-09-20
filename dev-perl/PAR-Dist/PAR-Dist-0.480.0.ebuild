# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=4

MODULE_AUTHOR=SMUELLER
MODULE_VERSION=0.48
inherit perl-module

DESCRIPTION="Create and manipulate PAR distributions"

SLOT="0"
KEYWORDS="~alpha amd64 ~arm hppa ~ia64 ~ppc ppc64 ~s390 ~sh ~sparc x86 ~x86-fbsd ~amd64-linux ~ppc-macos ~x64-macos ~x86-macos ~x86-solaris"
IUSE=""

DEPEND="
	virtual/perl-File-Spec
	virtual/perl-File-Temp
	|| ( dev-perl/YAML-Syck dev-perl/yaml )
	dev-perl/Archive-Zip"
	# || ( YAML::Syck YAML YAML-Tiny YAML-XS Parse-CPAN-Meta )
RDEPEND="${DEPEND}"

SRC_TEST="do"
