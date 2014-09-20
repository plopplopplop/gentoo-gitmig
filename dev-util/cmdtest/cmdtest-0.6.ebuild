# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="black box tests Unix command line tools"
HOMEPAGE="http://liw.fi/cmdtest/"
SRC_URI="http://code.liw.fi/debian/pool/main/c/${PN}/${PN}_${PV}.orig.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	${PYTHON_DEPS}
	dev-python/cliapp
	dev-python/ttystatus
"

src_compile() {
	addwrite /proc/self/comm
	distutils-r1_src_compile
}
