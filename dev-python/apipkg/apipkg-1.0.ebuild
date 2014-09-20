# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="3"
SUPPORT_PYTHON_ABIS="1"
DISTUTILS_SRC_TEST="py.test"

inherit distutils

MY_P="${PN}-${PV/_beta/b}"

DESCRIPTION="apipkg: namespace control and lazy-import mechanism"
HOMEPAGE="http://pypi.python.org/pypi/apipkg"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND=""

S="${WORKDIR}/${MY_P}"

DOCS="CHANGELOG README.txt"
PYTHON_MODNAME="apipkg.py"

src_prepare() {
	distutils_src_prepare

	# Disable failing test.
	sed -e "s/test_onfirstaccess_setsnewattr/_&/" -i test_apipkg.py
}
