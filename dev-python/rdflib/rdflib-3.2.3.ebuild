# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/rdflib/rdflib-3.2.3.ebuild,v 1.9 2013/02/02 22:30:54 ago Exp $

EAPI="4"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="*-pypy-*"
DISTUTILS_SRC_TEST="nosetests"

inherit distutils

DESCRIPTION="RDF library containing a triple store and parser/serializer"
HOMEPAGE="https://github.com/RDFLib/rdflib http://pypi.python.org/pypi/rdflib"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="berkdb examples mysql redland sqlite"

RDEPEND="dev-python/isodate
	berkdb? ( dev-python/bsddb3 )
	mysql? ( dev-python/mysql-python )
	redland? ( dev-libs/redland-bindings[python] )
	sqlite? ( || ( dev-lang/python:2.7[sqlite] dev-lang/python:2.6[sqlite]
			dev-lang/python:2.5[sqlite] dev-python/pysqlite ) )"
DEPEND="${RDEPEND}
	dev-python/setuptools"

src_prepare() {
	# Upstream manufactured .pyc files which promptly break distutils' src_test
	distutils_src_prepare
	find -name "*.py[c~]" -delete
}

src_install() {
	distutils_src_install

	if use examples; then
		insinto /usr/share/doc/${PF}/examples
		doins -r examples/*
	fi
}

src_test() {
	distutils_src_test --py3where='build/src'
}
