# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/flask-whooshalchemy/flask-whooshalchemy-0.56.ebuild,v 1.1 2014/07/27 01:32:02 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} pypy )

RESTRICT="test"		# appears pretty borken

inherit distutils-r1

MY_PN="Flask-WhooshAlchemy"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Whoosh extension to Flask/SQLAlchemy"
HOMEPAGE="https://github.com/gyllstromk/Flask-WhooshAlchemy https://pypi.python.org/pypi/${MY_PN}"
SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-python/flask[${PYTHON_USEDEP}]
	dev-python/flask-sqlalchemy[${PYTHON_USEDEP}]
	dev-python/blinker[${PYTHON_USEDEP}]
	dev-python/whoosh[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
#	test? (
#		dev-python/flask-testing[${PYTHON_USEDEP}] )"

S="${WORKDIR}/${MY_P}"

python_test() {
	nosetests || die "Testing failed with ${EPYTHON}"
}
