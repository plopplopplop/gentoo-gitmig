# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

MODULE_AUTHOR=POTYL
MODULE_VERSION=0.05
inherit perl-module

DESCRIPTION="Perl binding for C libunique library"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	dev-libs/libunique:1
	dev-perl/gtk2-perl
"
DEPEND="${RDEPEND}
	dev-perl/glib-perl
	dev-perl/extutils-depends
	dev-perl/extutils-pkgconfig
"

PATCHES=( "${FILESDIR}"/${PN}-0.05-implicit-pointer.patch )
