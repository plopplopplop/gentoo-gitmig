# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/xxkb/xxkb-1.11-r3.ebuild,v 1.1 2014/09/18 18:40:50 jer Exp $

EAPI=5
inherit eutils multilib

DESCRIPTION="eXtended XKB - assign different keymaps to different windows"
HOMEPAGE="http://sourceforge.net/projects/xxkb/"
SRC_URI="mirror://sourceforge/${PN}/${P}-src.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="svg"

RDEPEND="
	x11-libs/libX11
	x11-libs/libXpm
	x11-libs/libXt
	svg? (
		dev-libs/glib:2
		gnome-base/librsvg:2
		x11-libs/gtk+:2
	)
"
DEPEND="
	${RDEPEND}
	app-text/rman
	svg? ( virtual/pkgconfig )
	x11-misc/imake
"

S="${WORKDIR}/${PN}"

src_prepare() {
	mkdir flags
	epatch "${FILESDIR}"/svg-flags.patch
	use svg && epatch "${FILESDIR}"/svg-appdefaults.patch
	epatch "${FILESDIR}"/missing_init.patch
}

src_configure() {
	xmkmf $(usex svg -DWITH_SVG_SUPPORT '') || die
}

src_compile() {
	emake \
		CDEBUGFLAGS="${CFLAGS}" \
		EXTRA_LIBRARIES="-lXext" \
		LOCAL_LDFLAGS="${LDFLAGS}" \
		PIXMAPDIR=/usr/share/xxkb \
		PROJECTROOT=/usr
}

src_install() {
	local myopts
	if use svg; then
		myopts="PIXMAPS=flags/de.svg flags/pl.svg flags/il.svg flags/by.svg \
		flags/ua.svg flags/su.svg flags/ru.svg flags/bg.svg flags/en.svg"
	else
		myopts="FOOBAR=buzz"
	fi

	emake "${myopts}"  DESTDIR="${D}" install
	rm -r "${D}"/usr/$(get_libdir)/X11/app-defaults || die

	emake DESTDIR="${D}" install.man

	insinto /usr/share/xxkb
	use svg || doins "${FILESDIR}"/*.xpm
	dodoc README* CHANGES*
}
