# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=4

inherit cmake-utils

DESCRIPTION="Qt application for getting screenshots"
HOMEPAGE="http://code.google.com/p/screengrab-qt/"
SRC_URI="http://screengrab-qt.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="x11-libs/libX11
	dev-qt/qtcore:4
	dev-qt/qtgui:4"
RDEPEND="${DEPEND}"

src_prepare() {
	# Install docs into the right dir, but skip the license.
	# Respect CXXFLAGS.
	sed -i -e "/LICENSE.txt/d" \
		-e "/SG_DOCDIR/s:share/doc/screengrab:${PF}:" \
		-e "/CMAKE_CXX_FLAGS/s:\"): ${CXXFLAGS}&:" \
		CMakeLists.txt || die
}
