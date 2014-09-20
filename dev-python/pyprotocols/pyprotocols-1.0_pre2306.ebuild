# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.* 2.7-pypy-* *-jython"
DISTUTILS_SRC_TEST="setup.py"

inherit distutils

MY_PN="PyProtocols"
MY_P="${MY_PN}-${PV/_pre/a0dev_r}"

DESCRIPTION="Extends the PEP 246 adapt function with a new 'declaration API'"
HOMEPAGE="http://peak.telecommunity.com/PyProtocols.html http://pypi.python.org/pypi/PyProtocols"
# http://svn.eby-sarna.com/PyProtocols/
SRC_URI="mirror://gentoo/${MY_P}.tar.gz"

LICENSE="|| ( PSF-2 ZPL )"
SLOT="0"
KEYWORDS="amd64 ~ia64 ppc x86 ~amd64-linux ~x86-linux ~x86-macos"
IUSE=""

RDEPEND=">=dev-python/decoratortools-1.4"
DEPEND="${RDEPEND}
	dev-python/pyrex
	dev-python/setuptools"

S="${WORKDIR}/${MY_PN}"

PYTHON_CFLAGS=("2.* + -fno-strict-aliasing")

DOCS="CHANGES.txt README.txt UPGRADING.txt"
PYTHON_MODNAME="protocols"
