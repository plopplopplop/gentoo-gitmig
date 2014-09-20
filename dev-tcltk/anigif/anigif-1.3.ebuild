# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-tcltk/anigif/anigif-1.3.ebuild,v 1.6 2012/12/05 20:45:20 ulm Exp $

inherit multilib

DESCRIPTION="Image rotation package"
HOMEPAGE="http://cardtable.sourceforge.net/tcltk/"
SRC_URI="http://dev.gentooexperimental.org/~jlec/distfiles/${P}.zip"

LICENSE="tcltk"
SLOT="0"
KEYWORDS="amd64 ~ppc x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="dev-lang/tcl"
DEPEND="app-arch/unzip"

S="${WORKDIR}"

src_install() {
	insinto /usr/$(get_libdir)/${P}
	doins * || die
}
