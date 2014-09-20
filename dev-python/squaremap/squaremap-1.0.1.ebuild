# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="4"

SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.4"
RESTRICT_PYTHON_ABIS="3.*"

MY_PN="SquareMap"
MY_P="${MY_PN}-${PV/_beta/b}"

inherit distutils

DESCRIPTION="Hierarchic data-visualisation control for wxPython"
HOMEPAGE="http://pypi.python.org/pypi/SquareMap"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${MY_P}
