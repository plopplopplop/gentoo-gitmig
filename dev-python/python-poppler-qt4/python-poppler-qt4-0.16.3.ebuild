# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=4

PYTHON_DEPEND="2:2.6"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.5 3.* *-pypy-*"

inherit distutils

DESCRIPTION="A python binding for libpoppler-qt4"
HOMEPAGE="http://code.google.com/p/python-poppler-qt4/"
SRC_URI="http://${PN}.googlecode.com/files/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="app-text/poppler[qt4]
	dev-python/PyQt4
	>=dev-python/sip-4.9.1"
DEPEND="${RDEPEND}"
