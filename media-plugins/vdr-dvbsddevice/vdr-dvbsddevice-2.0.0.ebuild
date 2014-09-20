# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/vdr-dvbsddevice/vdr-dvbsddevice-2.0.0.ebuild,v 1.1 2013/03/31 12:04:08 hd_brummy Exp $

EAPI="5"

inherit vdr-plugin-2

DESCRIPTION="VDR Plugin: output device for the 'Full Featured' SD DVB Card"
HOMEPAGE="http://www.tvdr.de/"
SRC_URI="http://dev.gentoo.org/~hd_brummy/distfiles/${P}.tar.gz"

KEYWORDS="~x86 ~amd64"
SLOT="0"
LICENSE="GPL-2"
IUSE=""

DEPEND=">=media-video/vdr-1.7.36"
RDEPEND="${DEPEND}"

src_install() {
	vdr-plugin-2_src_install

	doheader "${S}"/dvbsdffdevice.h
}
