# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="3"

DESCRIPTION="The Simple Recursive Functions programming language"
HOMEPAGE="http://www.stratigery.com/srf.html"
SRC_URI="http://www.stratigery.com/srf.html/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~x86-linux ~ppc-macos ~amd64"
IUSE=""

DEPEND="sys-devel/flex
	virtual/yacc"
RDEPEND=""

src_prepare() {
	# Remove CVS directory Bug#371821
	rm -rf examples/CVS || die "removing CVS directory failed"
}

src_install() {
	dobin srf rfunc/rfunc || die "cannot instal binary"
	doman srf.1 || die "cannot install man page"
	dodoc srf.html README || die "cannot install docs"
	docinto examples
	dodoc examples/* || die "cannot install examples"
}
