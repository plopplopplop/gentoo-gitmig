# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=2
ECVS_SERVER="cdw.cvs.sourceforge.net:/cvsroot/cdw"
ECVS_MODULE="cdw"
ECVS_TOPDIR="${DISTDIR}/cvs-src/${ECVS_MODULE}"

inherit autotools eutils cvs

MY_P=${PN}_${PV}
DESCRIPTION="An ncurses based console frontend for cdrtools and dvd+rw-tools"
HOMEPAGE="http://cdw.sourceforge.net"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="virtual/cdrtools
	app-cdr/dvd+rw-tools
	dev-libs/libburn
	dev-libs/libcdio[-minimal]
	sys-libs/ncurses[unicode]"

S=${WORKDIR}/${ECVS_MODULE}

src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog NEWS README THANKS cdw.conf
}
