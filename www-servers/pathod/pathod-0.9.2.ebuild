# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="A collection of pathological tools for testing and torturing HTTP clients and servers"
HOMEPAGE="http://pathod.net/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=">=dev-python/netlib-${PV}[${PYTHON_USEDEP}]
	>=dev-python/requests-1.1.0[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? ( dev-python/nose[${PYTHON_USEDEP}] )"

PATCHES=( "${FILESDIR}"/${P}-skip-cert-test.patch )

python_test() {
	nosetests -v || die "Tests fail with ${EPYTHON}"
}
