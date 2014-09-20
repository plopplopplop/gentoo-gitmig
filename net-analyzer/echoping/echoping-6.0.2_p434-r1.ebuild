# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/echoping/echoping-6.0.2_p434-r1.ebuild,v 1.1 2013/09/04 12:30:34 jer Exp $

EAPI=5
inherit autotools eutils

DESCRIPTION="Small program to test performances of remote servers"
HOMEPAGE="http://echoping.sourceforge.net/"
SRC_URI="http://dev.gentoo.org/~jer/${P}.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~hppa ~x86"
IUSE="gnutls http icp idn priority smtp ssl tos postgres ldap"
RESTRICT="test"

RDEPEND="idn? ( net-dns/libidn )
	postgres? ( dev-db/postgresql-base )
	ldap? ( net-nds/openldap )
	ssl? (
		gnutls? ( >=net-libs/gnutls-1.0.17 )
		!gnutls? ( >=dev-libs/openssl-0.9.7d )
	)"
DEPEND="${RDEPEND}
	>=sys-devel/libtool-2"

REQUIRED_USE="gnutls? ( ssl )"

DOCS=( README AUTHORS ChangeLog DETAILS NEWS TODO )

src_prepare() {
	epatch "${FILESDIR}"/${PN}-6.0.2_p434-fix_implicit_declarations.patch

	cp /usr/share/libtool/config/ltmain.sh .
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable http)  \
		$(use_enable icp) \
		$(use_enable priority) \
		$(use_enable smtp) \
		$(use_enable tos) \
		$(use_with idn libidn) \
		$(usex gnutls $(use_with gnutls) $(use_with ssl)) \
		--config-cache \
		--disable-static \
		--disable-ttcp
}

src_install() {
	default
	prune_libtool_files
}
