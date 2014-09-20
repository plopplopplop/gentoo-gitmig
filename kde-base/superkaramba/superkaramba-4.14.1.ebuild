# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/superkaramba/superkaramba-4.14.1.ebuild,v 1.1 2014/09/16 18:17:25 johu Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )
inherit python-single-r1 kde4-base

DESCRIPTION="A tool to create interactive applets for the KDE desktop"
HOMEPAGE="http://www.kde.org/applications/utilities/superkaramba
http://utils.kde.org/projects/superkaramba"
KEYWORDS=" ~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug python"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

DEPEND="
	media-libs/qimageblitz
	x11-libs/libX11
	x11-libs/libXrender
	python? (
		${PYTHON_DEPS}
		$(add_kdebase_dep pykde4 "${PYTHON_USEDEP}")
	)
"
RDEPEND="${DEPEND}
	python? ( $(add_kdebase_dep krosspython "${PYTHON_USEDEP}") )
"

pkg_setup() {
	use python && python-single-r1_pkg_setup
	kde4-base_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_with python PythonLibs)
	)

	kde4-base_src_configure
}
