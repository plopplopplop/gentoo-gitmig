# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/django-recaptcha/django-recaptcha-1.0.ebuild,v 1.2 2014/05/10 23:43:59 patrick Exp $

EAPI="5"

PYTHON_COMPAT=( python{2_7,3_3,3_4} ) #  pypy ) needs django to be pypy'ed too
inherit distutils-r1

DESCRIPTION="Django recaptcha form field/widget app"
HOMEPAGE="http://github.com/praekelt/django-recaptcha http://pypi.python.org/pypi/django-recaptcha"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
SRC_URI="https://github.com/praekelt/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-python/django[${PYTHON_USEDEP}]"
DEPEND="test? ( ${RDEPEND}
		>=dev-python/django-setuptest-0.0.6[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	esetup.py test
}
