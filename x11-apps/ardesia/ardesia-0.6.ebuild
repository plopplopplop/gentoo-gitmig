# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=3

HOMEPAGE="http://code.google.com/p/ardesia/"
SRC_URI="http://ardesia.googlecode.com/files/${P}.tar.gz"
DESCRIPTION="Color, record and share free-hand annotations on screen and on network"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cwiid"

RDEPEND="dev-libs/atk
	dev-libs/libsigsegv
	media-libs/fontconfig
	media-libs/libpng
	sci-libs/gsl
	sys-devel/gettext
	x11-libs/cairo
	x11-libs/gtk+:2
	cwiid? ( app-misc/cwiid )"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" ardesiadocdir="/usr/share/doc/${P}" install || die "make install ardesia failed"
}

pkg_postinst() {
	elog "Ardesia requires a Composite Manager, such as Compiz"
	elog "Metacity with compositing, Kwin, etc in order to run"
	echo
}
