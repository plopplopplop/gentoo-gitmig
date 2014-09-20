# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Lightweight SOAP client"
HOMEPAGE="https://fedorahosted.org/suds/ http://pypi.python.org/pypi/suds"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
IUSE="doc"

DEPEND="dev-python/setuptools
	doc? ( dev-python/epydoc )"
RDEPEND=""

src_compile() {
	distutils_src_compile

	if use doc; then
		einfo "Generation of documentation"
		epydoc -n "Suds - ${DESCRIPTION}" -o doc suds || die "Generation of documentation failed"
	fi
}

src_install() {
	distutils_src_install

	if use doc; then
		dohtml -r doc/* || die "Installation of documentation failed"
	fi
}
