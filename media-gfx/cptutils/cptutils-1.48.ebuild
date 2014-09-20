# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5
PYTHON_COMPAT=( python2_{6,7} )

inherit python-single-r1

DESCRIPTION="A number of utilities for the manipulation of color gradient files"
HOMEPAGE="http://soliton.vm.bytemark.co.uk/pub/jjg/en/code/cptutils.html"
SRC_URI="http://soliton.vm.bytemark.co.uk/pub/jjg/code/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

CDEPEND="dev-libs/libxml2:2
	media-libs/libpng:0="
RDEPEND="${CDEPEND}
	${PYTHON_DEPS}"
DEPEND="${CDEPEND}"

src_prepare() {
	python_fix_shebang src/gradient-convert/gradient-convert.py
}
