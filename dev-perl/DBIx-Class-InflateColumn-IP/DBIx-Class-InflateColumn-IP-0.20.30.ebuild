# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=4

MODULE_AUTHOR=ILMARI
MODULE_VERSION=0.02003
inherit perl-module

DESCRIPTION="Auto-create NetAddr::IP objects from columns"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-perl/NetAddr-IP
	>=dev-perl/DBIx-Class-0.81.70
"
DEPEND="${RDEPEND}"
