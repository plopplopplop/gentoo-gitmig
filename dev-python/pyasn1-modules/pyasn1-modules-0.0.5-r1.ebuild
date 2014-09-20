# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pyasn1-modules/pyasn1-modules-0.0.5-r1.ebuild,v 1.2 2014/09/02 08:00:52 idella4 Exp $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4} pypy )

inherit distutils-r1

DESCRIPTION="pyasn1 modules"
HOMEPAGE="http://pyasn1.sourceforge.net/ http://pypi.python.org/pypi/pyasn1-modules"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""

RDEPEND="dev-python/pyasn1[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	echoit() { echo "$@"; "$@"; }
	local exit_status=0 test
	for test in test/*.sh; do
		PATH="${S}/tools:${PATH}" \
			echoit sh "${test}" || exit_status=1
	done
	return ${exit_status}
}

python_install_all() {
	distutils-r1_python_install_all
	insinto /usr/share/doc/${PF}/tools
	doins tools/* || die "doins failed"
}
