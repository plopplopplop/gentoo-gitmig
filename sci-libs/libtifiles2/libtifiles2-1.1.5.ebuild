# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-libs/libtifiles2/libtifiles2-1.1.5.ebuild,v 1.3 2012/08/04 15:03:23 bicatali Exp $

EAPI=4

inherit multilib

DESCRIPTION="Library for TI calculator files"
HOMEPAGE="http://lpg.ticalc.org/prj_tilp/"
SRC_URI="mirror://sourceforge/tilp/tilp2-linux/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE="doc nls static-libs"

RDEPEND="dev-libs/glib:2
	>=sci-libs/libticables2-1.3.3
	>=sci-libs/libticonv-1.1.3
	nls? ( virtual/libintl )"

DEPEND="${RDEPEND}
	virtual/pkgconfig
	nls? ( sys-devel/gettext )"

DOCS=( AUTHORS LOGO NEWS README ChangeLog docs/api.txt )

src_prepare() {
	sed -e '/define _ZLIBIOAPI_H/ a#define OF(x) x' \
		-i src/minizip/ioapi.h || die #403387
}

src_configure() {
	econf \
		--disable-rpath \
		$(use_enable nls) \
		$(use_enable static-libs static)
}

src_install() {
	default
	use doc && dohtml docs/html/*
	use static-libs || rm -f "${D}"/usr/$(get_libdir)/${PN}.la
}
