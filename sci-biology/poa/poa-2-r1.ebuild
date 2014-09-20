# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="3"

inherit eutils

MY_P="${PN}V${PV}"

DESCRIPTION="Fast multiple sequence alignments using partial-order graphs"
HOMEPAGE="http://bioinfo.mbi.ucla.edu/poa/"
SRC_URI="mirror://sourceforge/poamsa/${MY_P}.tar.gz"

# According to SF project page
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

S="${WORKDIR}/${MY_P}"

src_prepare() {
	epatch "${FILESDIR}"/${PV}-respect-flags.patch
}

src_compile() {
	emake \
		CC="$(tc-getCC)" \
		OPT_CFLAGS="${CFLAGS}" \
		poa || die "make failed"
}

src_install() {
	dobin "${S}"/poa "${S}"/make_pscores.pl || die
	dolib.a "${S}"/liblpo.a || die
	dodoc "${S}"/README "${S}"/multidom.* || die
	insinto /usr/share/poa
	doins "${S}"/*.mat || die
}

pkg_postinst() {
	elog "poa requires a score matrix as the first argument."
	elog "This package installs two examples to ${EROOT}usr/share/poa/."
}
