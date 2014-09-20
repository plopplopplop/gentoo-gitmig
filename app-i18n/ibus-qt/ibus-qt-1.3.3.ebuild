# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="5"
inherit cmake-utils eutils multilib

DESCRIPTION="Qt IBus library and Qt input method plugin"
HOMEPAGE="http://code.google.com/p/ibus/"
SRC_URI="https://github.com/ibus/ibus-qt/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc"

RDEPEND=">=app-i18n/ibus-1.3.7
	>=sys-apps/dbus-1.2
	x11-libs/libX11
	>=dev-qt/qtcore-4.5:4
	>=dev-qt/qtdbus-4.5:4"
DEPEND="${RDEPEND}
	>=dev-libs/icu-4:=
	dev-util/cmake
	virtual/pkgconfig
	doc? ( app-doc/doxygen )"

DOCS="AUTHORS README TODO"

PATCHES=( "${FILESDIR}"/${PN}-1.3-doc.patch )

mycmakeargs="-DLIBDIR=$(get_libdir) all"

src_compile() {
	cmake-utils_src_compile

	if use doc ; then
		cd "${CMAKE_BUILD_DIR}"
		emake docs || die
	fi
}

src_install() {
	if use doc ; then
		HTML_DOCS="${CMAKE_BUILD_DIR}/docs/html/*"
	fi

	cmake-utils_src_install
}
