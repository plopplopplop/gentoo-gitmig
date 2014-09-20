# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/the_silver_searcher/the_silver_searcher-0.23.0.ebuild,v 1.2 2014/07/16 07:58:07 zlogene Exp $

EAPI=5
inherit autotools bash-completion-r1

DESCRIPTION="A code-searching tool similar to ack, but faster"
HOMEPAGE="http://github.com/ggreer/the_silver_searcher"
SRC_URI="https://github.com/ggreer/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~mips ~ppc ~ppc64 ~x86 ~amd64-fbsd ~x86-fbsd"
IUSE="lzma zlib"

RDEPEND="dev-libs/libpcre
	lzma? ( app-arch/xz-utils )
	zlib? ( sys-libs/zlib )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS="README.md"

src_prepare() {
	sed -i '/^dist_bashcomp/d' Makefile.am || die

	eautoreconf
}

src_configure() {
	econf \
		$(use_enable lzma) \
		$(use_enable zlib)
}

src_install() {
	default
	newbashcomp ag.bashcomp.sh ag
}
