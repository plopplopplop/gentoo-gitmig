# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="Python bindings for Augeas"
HOMEPAGE="http://augeas.net/"
#SRC_URI="https://fedorahosted.org/released/${PN}/${P}.tar.gz"
SRC_URI="http://dev.gentoo.org/~jlec/distfiles/${P}.tar.xz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-admin/augeas"
RDEPEND="${DEPEND}"

DOCS="AUTHORS README.txt"
PYTHON_MODNAME="augeas.py"

python_test() {
	cd test || die
	"${PYTHON}" test_augeas.py || die
}
