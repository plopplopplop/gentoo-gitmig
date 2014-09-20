# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-libs/libfame/libfame-0.9.1-r2.ebuild,v 1.10 2014/01/26 12:14:55 ago Exp $

EAPI=5

AUTOTOOLS_AUTORECONF=1

inherit autotools-multilib

PATCHLEVEL="2"
DESCRIPTION="MPEG-1 and MPEG-4 video encoding library"
HOMEPAGE="http://fame.sourceforge.net/"
SRC_URI="mirror://sourceforge/fame/${P}.tar.gz
	http://digilander.libero.it/dgp85/gentoo/${PN}-patches-${PATCHLEVEL}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 ~sh sparc x86"
IUSE="mmx static-libs"

PATCHES=(
	"${FILESDIR}"/${P}-gcc43.patch
	"${FILESDIR}"/${P}-mmx-configure.ac.patch )

DOCS=( AUTHORS BUGS CHANGES README TODO )

src_prepare() {
	EPATCH_SUFFIX="patch" epatch "${WORKDIR}"/${PV}

	# Do not add -march=i586, bug #41770.
	sed -i -e 's:-march=i[345]86 ::g' configure.in || die

	rm -f acinclude.m4

	autotools-multilib_src_prepare
}

src_configure() {
	local myeconfargs=(
		$(use_enable mmx)
	)
	autotools-multilib_src_configure
}
