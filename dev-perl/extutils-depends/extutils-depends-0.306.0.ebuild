# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/extutils-depends/extutils-depends-0.306.0.ebuild,v 1.10 2014/08/06 20:34:30 jer Exp $

EAPI=5

MY_PN=ExtUtils-Depends
MODULE_AUTHOR=XAOC
MODULE_VERSION=0.306
inherit perl-module

DESCRIPTION="Easily build XS extensions that depend on XS extensions"

SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 ~s390 ~sh sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~x86-solaris"
IUSE=""

SRC_TEST="do parallel"
