# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/plasma-runtime/plasma-runtime-4.13.3.ebuild,v 1.1 2014/07/16 17:40:33 johu Exp $

EAPI=5

KMNAME="kde-runtime"
KMMODULE="plasma"
DECLARATIVE_REQUIRED="always"
inherit kde4-meta

DESCRIPTION="Script engine and package tool for plasma"
KEYWORDS=" ~amd64 ~arm ~ppc ~ppc64 ~x86 ~x86-fbsd ~amd64-linux ~x86-linux"
IUSE="debug"

DEPEND="
	$(add_kdebase_dep kactivities)
"
RDEPEND="${DEPEND}"

RESTRICT=test
# bug 443748
