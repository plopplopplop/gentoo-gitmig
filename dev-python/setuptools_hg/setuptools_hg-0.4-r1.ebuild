# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} pypy pypy2_0 )

inherit distutils-r1

DESCRIPTION="Setuptools/distribute plugin for finding files under Mercurial version control"
HOMEPAGE="http://pypi.python.org/pypi/setuptools_hg http://bitbucket.org/jezdez/setuptools_hg/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND="dev-vcs/mercurial"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
