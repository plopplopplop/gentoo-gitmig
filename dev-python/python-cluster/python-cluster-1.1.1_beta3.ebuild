# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=3

PYTHON_DEPEND="*"
SUPPORT_PYTHON_ABIS=1
PYTHON_MODNAME="cluster.py"

inherit distutils eutils

MY_P=cluster-${PV/_beta/b}
DESCRIPTION="Allows grouping a list of arbitrary objects into related groups (clusters)"
HOMEPAGE="http://python-cluster.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

S="${WORKDIR}/${MY_P}"

src_prepare() {
	epatch "${FILESDIR}"/python-cluster-python3.patch
	distutils_src_prepare
}
