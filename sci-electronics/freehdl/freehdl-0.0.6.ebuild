# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-electronics/freehdl/freehdl-0.0.6.ebuild,v 1.3 2014/08/10 20:27:48 slyfox Exp $

DESCRIPTION="A free VHDL simulator"
SRC_URI="http://freehdl.seul.org/~enaroska/${P}.tar.gz"
HOMEPAGE="http://freehdl.seul.org/"
LICENSE="GPL-2"
DEPEND=">=sys-devel/gcc-3.4.3.20050110-r2
	virtual/pkgconfig"
RDEPEND=">=dev-scheme/guile-1.3.1"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~ppc ~x86"

src_install () {
	make DESTDIR="${D}" install || die "installation failed"
	dodoc AUTHORS ChangeLog HACKING NEWS README*
}
