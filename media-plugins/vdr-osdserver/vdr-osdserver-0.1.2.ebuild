# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/vdr-osdserver/vdr-osdserver-0.1.2.ebuild,v 1.3 2014/07/09 04:10:26 patrick Exp $

EAPI=5

inherit vdr-plugin-2

DESCRIPTION="VDR plugin: VDR OSD access for external programs through a TCP/IP socket connection"
HOMEPAGE="http://www.udo-richter.de/vdr/osdserver.en.html"
SRC_URI=" http://www.udo-richter.de/vdr/files/${P}.tgz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=media-video/vdr-1.4.6"

RDEPEND=""

PATCHES=( ${FILESDIR}/${PN}-0.1.1-gentoo.diff )

src_install() {
	vdr-plugin-2_src_install

	insinto /etc/vdr/plugins/osdserver
	doins   "${FILESDIR}"/osdserverhosts.conf

	dodoc examples/*
}

pkg_postinst() {
	vdr-plugin-2_pkg_postinst

	elog "Check configuration files:"
	elog "/etc/vdr/plugins/osdserver/osdserverhosts.conf"
	elog "/etc/conf.d/vdr.osdserver"
	elog "Examples are in '/usr/share/doc/vdr/${P}/'"
}
