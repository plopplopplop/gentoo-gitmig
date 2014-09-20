# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Devel-GlobalDestruction/Devel-GlobalDestruction-0.90.0-r1.ebuild,v 1.1 2014/08/26 18:07:11 axs Exp $

EAPI=5

MODULE_AUTHOR=RIBASUSHI
MODULE_VERSION=0.09
inherit perl-module

DESCRIPTION="Expose PL_dirty, the flag which marks global destruction"

SLOT="0"
KEYWORDS="~amd64 ~arm ~x86 ~ppc-aix ~x86-solaris"
IUSE=""

RDEPEND=">=dev-perl/Sub-Exporter-Progressive-0.1.2"
DEPEND="${RDEPEND}"

SRC_TEST=do
