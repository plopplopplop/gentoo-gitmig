# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=4

inherit autotools-utils

DESCRIPTION="mccp extension to TCL"
HOMEPAGE="http://tcl-mccp.sf.net/"
SRC_URI="mirror://sourceforge/tcl-mccp/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ppc ~sparc ~x86"
IUSE="static-libs"

DEPEND="dev-lang/tcl"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}"/${P}-flags.patch )
