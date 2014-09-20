# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-fs/dmg2img/dmg2img-1.6.5.ebuild,v 1.1 2013/09/05 08:34:59 radhermit Exp $

EAPI=4
inherit toolchain-funcs

DESCRIPTION="Converts Apple DMG files to standard HFS+ images"
HOMEPAGE="http://vu1tur.eu.org/tools"
SRC_URI="http://vu1tur.eu.org/tools/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND="dev-libs/openssl
	app-arch/bzip2
	sys-libs/zlib"
DEPEND="${RDEPEND}
	sys-apps/sed"

src_prepare() {
	sed -i -e 's:-s:$(LDFLAGS):g' Makefile || die "sed failed"
}

src_compile() {
	tc-export CC
	emake CFLAGS="${CFLAGS}"
}

src_install() {
	dobin dmg2img vfdecrypt
	dodoc README
	doman vfdecrypt.1
}
