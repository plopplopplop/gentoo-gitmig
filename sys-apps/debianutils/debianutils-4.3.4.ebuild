# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/debianutils/debianutils-4.3.4.ebuild,v 1.13 2013/09/05 09:50:09 vapier Exp $

EAPI=4

inherit eutils flag-o-matic

DESCRIPTION="A selection of tools from Debian"
HOMEPAGE="http://packages.qa.debian.org/d/debianutils.html"
SRC_URI="mirror://debian/pool/main/d/${PN}/${PN}_${PV}.tar.gz"

LICENSE="BSD GPL-2 SMAIL"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~arm-linux ~x86-linux"
IUSE="kernel_linux static"

PDEPEND="|| ( >=sys-apps/coreutils-6.10-r1 sys-freebsd/freebsd-ubin )"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-3.4.2-no-bs-namespace.patch
}

src_configure() {
	use static && append-ldflags -static
	default
}

src_install() {
	into /
	dobin tempfile run-parts
	if use kernel_linux ; then
		dosbin installkernel
	fi

	into /usr
	dosbin savelog

	doman tempfile.1 run-parts.8 savelog.8
	use kernel_linux && doman installkernel.8
	cd debian
	dodoc changelog control
	keepdir /etc/kernel/postinst.d
}
