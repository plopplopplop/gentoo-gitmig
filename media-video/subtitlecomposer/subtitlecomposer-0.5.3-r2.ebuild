# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

KDE_LINGUAS="bg cs de el es fr pl pt_BR sr"
inherit kde4-base

DESCRIPTION="Text-based subtitles editor"
HOMEPAGE="https://github.com/maxrd2/subtitlecomposer"
SRC_URI="mirror://sourceforge/subcomposer/${P}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="amd64 x86"
SLOT="4"
IUSE="debug gstreamer xine"

RDEPEND="
	gstreamer? ( media-libs/gstreamer:0.10 )
	xine? ( media-libs/xine-lib )
"
DEPEND="${RDEPEND}
	sys-devel/gettext
"

PATCHES=(
	"${FILESDIR}/${PN}-linkage-patch.patch"
	"${FILESDIR}/${P}-gcc45.patch"
	"${FILESDIR}/${P}-gold-gstreamer.patch"
	"${FILESDIR}/${P}-gold-xine.patch"
)

src_prepare() {
	kde4-base_src_prepare

	sed -e '/ADD_SUBDIRECTORY( api )/s/^/# DISABLED/' \
		-i src/main/scripting/examples/CMakeLists.txt \
		|| die "failed to disable installation of scripting API"
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with gstreamer GStreamer)
		$(cmake-utils_use_with xine)
	)
	kde4-base_src_configure
}

pkg_postinst() {
	kde4-base_pkg_postinst

	echo
	elog "Some example scripts provided by ${PV} require dev-lang/ruby"
	elog "or dev-lang/python to be installed."
	echo
}
