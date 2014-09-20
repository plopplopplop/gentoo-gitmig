# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=4

inherit autotools eutils flag-o-matic

DESCRIPTION="Computing Triangulations Of Point Configurations and Oriented Matroids"
HOMEPAGE="http://www.rambau.wm.uni-bayreuth.de/TOPCOM/"
SRC_URI="
	http://www.uni-bayreuth.de/departments/wirtschaftsmathematik/rambau/Software/TOPCOM-${PV}.tar.gz
	doc? ( http://www.rambau.wm.uni-bayreuth.de/TOPCOM/TOPCOM-manual.html )"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples"

DEPEND="
	dev-libs/gmp
	sci-libs/cddlib"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/TOPCOM-${PV}

AUTOTOOLS_IN_SOURCE_BUILD=1

src_prepare () {
	# Don't compile internal GMP and CDD ...
	epatch "${FILESDIR}"/${P}-no-internal-libs.patch

	# ... and link in tree versions:
	append-libs -lgmp -lgmpxx -lcddgmp

	eautoreconf
}

src_install () {
	default

	use doc && dohtml "${DISTDIR}"/TOPCOM-manual.html

	use examples && dodoc -r "${S}"/examples
}
