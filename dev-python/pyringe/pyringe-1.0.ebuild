# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/pyringe/pyringe-1.0.ebuild,v 1.1 2014/04/16 16:30:50 dastergon Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Debugger capable of attaching and injecting code"
HOMEPAGE="https://github.com/google/pyringe https://pypi.python.org/pypi/pyringe/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
DOCS=( README.md )
