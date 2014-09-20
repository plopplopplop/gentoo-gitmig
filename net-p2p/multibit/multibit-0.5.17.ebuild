# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-p2p/multibit/multibit-0.5.17.ebuild,v 1.1 2014/04/14 11:13:27 blueness Exp $

EAPI=5

inherit eutils

DESCRIPTION="MultiBit is a secure, lightweight, international Bitcoin wallet written in Java"
HOMEPAGE="https://multibit.org/"
SRC_URI="https://multibit.org/releases/${P}/${P}-linux.jar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=virtual/jre-1.6"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_unpack() {
:
}

src_prepare() {
	cp "${FILESDIR}"/auto-install.xml "${WORKDIR}"
	sed -i "s:ED:${ED}:" auto-install.xml
}

src_install() {
	exeinto /usr/bin
	doexe "${FILESDIR}"/${PN}

	make_desktop_entry "${PN}" "Multibit" "/opt/MultiBit/multibit48.png" "GNOME;Network;P2P;Office;Finance;" "MimeType=x-scheme-handler/multibit;\nTerminal=false"

	java -jar "${DISTDIR}"/${P}-linux.jar auto-install.xml >/dev/null 2>&1
}
