# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Python SDK for OpenStack/Rackspace APIs"
HOMEPAGE="https://github.com/openstack/python-novaclient"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		test? (	dev-python/mock
				>=dev-python/python-novaclient-2.10.0[${PYTHON_USEDEP}]
				dev-python/python-swiftclient[${PYTHON_USEDEP}] )"
RDEPEND="
		dev-python/httplib2[${PYTHON_USEDEP}]
		dev-python/keyring[${PYTHON_USEDEP}]
		dev-python/prettytable
		>=dev-python/python-novaclient-2.10.0[${PYTHON_USEDEP}]
		dev-python/python-swiftclient[${PYTHON_USEDEP}]
		dev-python/rackspace-novaclient[${PYTHON_USEDEP}]
		dev-python/simplejson[${PYTHON_USEDEP}]"

python_test() {
	"${PYTHON}" setup.py nosetests || die
}
