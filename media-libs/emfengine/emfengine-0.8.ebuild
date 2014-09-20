# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="3"

inherit eutils qt4-r2

MY_PN="EmfEngine"

DESCRIPTION="Native vector graphics file format on Windows"
HOMEPAGE="http://soft.proindependent.com/emf/index.html"
SRC_URI="mirror://berlios/qtiplot/${MY_PN}-${PV}-opensource.zip"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
LICENSE="GPL-3"
IUSE=""

RDEPEND="
	dev-qt/qtgui:4
	media-libs/libpng
	media-libs/libemf"
DEPEND="${RDEPEND}
	app-arch/unzip"

S="${WORKDIR}"/${MY_PN}

PATCHES=(
	"${FILESDIR}/0.7-config.patch"
	"${FILESDIR}/0.7-header.patch"
	"${FILESDIR}"/${PV}-example.patch
	)

src_prepare() {
	edos2unix EmfEngine.pro
	qt4-r2_src_prepare
	sed \
		-e "s:/usr/local/lib/libEMF.a:-lEMF:g" \
		-e "s:/usr/local/include:${EPREFIX}/usr/include/:g" \
		-i src/src.pro example/example.pro || die
}

src_install() {
	dolib.so libEmfEngine.so* || die
	insinto /usr/include
	doins src/*.h* || die
}
