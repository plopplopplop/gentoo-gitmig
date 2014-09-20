# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="4"

PYTHON_DEPEND="2"

inherit distutils

DESCRIPTION="Library for parsing the fastimport VCS serialization format"
HOMEPAGE="https://launchpad.net/python-fastimport"
MY_P="fastimport-${PV}"
SRC_URI="http://launchpad.net/${PN}/trunk/${PV}/+download/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND=""

PYTHON_MODNAME="fastimport"
S="${WORKDIR}/${MY_P}"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}
