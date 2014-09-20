# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/perl-core/Getopt-Long/Getopt-Long-2.380.0-r1.ebuild,v 1.1 2014/07/24 22:23:46 dilfridge Exp $

EAPI=5

MODULE_AUTHOR=JV
MODULE_VERSION=2.38
inherit perl-module

DESCRIPTION="Advanced handling of command line options"

SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris"
IUSE=""

RDEPEND="virtual/perl-Pod-Parser"
DEPEND="${RDEPEND}"

SRC_TEST=do
