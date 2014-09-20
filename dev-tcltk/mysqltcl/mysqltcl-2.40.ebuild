# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

DESCRIPTION="TCL MySQL Interface"
HOMEPAGE="http://www.xdobry.de/mysqltcl/"
SRC_URI="http://www.xdobry.de/mysqltcl/${P}.tar.gz"

LICENSE="HPND"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND="
	dev-lang/tcl
	virtual/mysql"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	# bug 119873
	sed -i -e "s/relid'/relid/" configure tclconfig/tcl.m4 || die
}

src_compile() {
	econf
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS README README-msqltcl ChangeLog
	dohtml doc/mysqltcl.html
}
