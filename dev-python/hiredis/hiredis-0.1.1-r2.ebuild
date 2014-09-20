# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="Python extension that wraps hiredis"
HOMEPAGE="https://github.com/pietern/hiredis-py"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="dev-libs/hiredis"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}"/${P}-system-libs.patch )
