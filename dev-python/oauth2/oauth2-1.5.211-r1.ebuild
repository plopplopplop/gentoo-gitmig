# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Library for OAuth version 1.0"
HOMEPAGE="http://pypi.python.org/pypi/oauth2"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x64-macos"
IUSE="test"

RDEPEND="dev-python/httplib2[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
	)"

PATCHES=( "${FILESDIR}/${PN}-exclude-tests.patch" )

python_test() {
	esetup.py test || die "Tests fail with ${EPYTHON}"
}
