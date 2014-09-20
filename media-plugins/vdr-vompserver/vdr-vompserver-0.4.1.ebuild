# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/vdr-vompserver/vdr-vompserver-0.4.1.ebuild,v 1.1 2014/02/18 13:27:22 hd_brummy Exp $

EAPI=5

inherit vdr-plugin-2

DESCRIPTION="VDR Plugin: server part for MediaMVP device"
HOMEPAGE="http://www.loggytronic.com/vomp.php"
SRC_URI="http://www.loggytronic.com/dl/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=media-video/vdr-1.7.36-r1"
RDEPEND="${DEPEND}"

KEEP_I18NOBJECT="yes"

src_install() {
	vdr-plugin-2_src_install

	insinto /etc/vdr/plugins/vompserver
	newins vomp.conf.sample vomp.conf
	newins vomp-00-00-00-00-00-00.conf.sample vomp-00-00-00-00-00-00.conf
}

pkg_postinst() {
	vdr-plugin-2_pkg_postinst

	elog "\nHave a look to the VOMP sample files in /etc/vdr/plugins.\n"

	elog "You have to download the dongle file (i.e. firmware) and adapt"
	elog "the vomp configuration files accordingly."
}
