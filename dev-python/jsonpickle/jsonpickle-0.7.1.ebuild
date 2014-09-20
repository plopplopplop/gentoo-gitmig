# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Python library for serializing any arbitrary object graph into JSON"
HOMEPAGE="http://jsonpickle.github.com/ http://pypi.python.org/pypi/jsonpickle"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="dev-python/simplejson[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	test? (
		dev-python/feedparser[${PYTHON_USEDEP}]
		dev-python/ujson[${PYTHON_USEDEP}] )"

PATCHES=( "${FILESDIR}"/${PN}-0.6.1-drop-brocken-backend.patch )

python_test() {
	${PYTHON} tests/runtests.py || die
}
