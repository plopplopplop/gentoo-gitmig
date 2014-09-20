# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/DateTime-Event-ICal/DateTime-Event-ICal-0.110.0.ebuild,v 1.1 2012/11/13 19:39:42 tove Exp $

EAPI=4

MODULE_AUTHOR=FGLOCK
MODULE_VERSION=0.11
inherit perl-module

DESCRIPTION="Perl DateTime extension for computing rfc2445 recurrences"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-perl/DateTime
	>=dev-perl/DateTime-Event-Recurrence-0.11"
DEPEND="${RDEPEND}"

SRC_TEST=do
