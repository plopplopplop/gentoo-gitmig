# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

ROX_VER=2.1.2
ROX_LIB_VER=2.0.2
inherit rox eutils

MY_PN="Fetch"
DESCRIPTION="Fetch - a downloader for the ROX Desktop"
HOMEPAGE="http://www.kerofin.demon.co.uk/rox/fetch.html"
SRC_URI="http://www.kerofin.demon.co.uk/rox/${MY_PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE=""

APPNAME=Fetch
S=${WORKDIR}
