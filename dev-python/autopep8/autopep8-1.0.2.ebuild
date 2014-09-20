# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/autopep8/autopep8-1.0.2.ebuild,v 1.2 2014/06/08 03:06:43 floppym Exp $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} pypy )

inherit distutils-r1 vcs-snapshot

DESCRIPTION="Automatically formats Python code to conform to the PEP 8 style guide"
HOMEPAGE="https://github.com/hhatto/autopep8 http://pypi.python.org/pypi/autopep8"
SRC_URI="https://github.com/hhatto/${PN}/tarball/ver${PV} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND=">=dev-python/pep8-1.5.6[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

python_prepare_all() {
	# Prevent UnicodeDecodeError with LANG=C
	sed -e "/é/d" -i MANIFEST.in || die
	distutils-r1_python_prepare_all
}

python_test() {
	esetup.py test
}

pkg_postinst() {
	ewarn "Since this version of autopep depends on >=dev-python/pep8-1.3"
	ewarn "it is affected by https://github.com/jcrocholl/pep8/issues/45"
	ewarn "(indentation checks inside triple-quotes)."
	ewarn "If you do not want to be affected by this, then add the"
	ewarn "following lines to your local package.mask:"
	ewarn "  >=dev-python/pep8-1.3"
	ewarn "  >=dev-python/autopep8-0.6"
}
