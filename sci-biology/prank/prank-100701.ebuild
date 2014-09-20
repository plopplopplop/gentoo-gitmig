# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=4

inherit toolchain-funcs

DESCRIPTION="Probabilistic Alignment Kit"
HOMEPAGE="http://www.ebi.ac.uk/goldman-srv/prank/prank/"
SRC_URI="http://www.ebi.ac.uk/goldman-srv/prank/src/prank/prank.src.${PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86"

S=${WORKDIR}/${PN}

src_prepare() {
	sed -i -e "s/\$(LINK)/& \$(LDFLAGS)/" Makefile || die
}

src_compile() {
	emake \
		LINK="$(tc-getCXX)" \
		CXX="$(tc-getCXX)" \
		CFLAGS="${CFLAGS}" \
		CXXFLAGS="${CXXFLAGS}"
}

src_install() {
	dobin prank
}
