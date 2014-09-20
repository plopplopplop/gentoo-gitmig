# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/krb5/krb5-0-r1.ebuild,v 1.10 2014/09/15 08:24:29 ago Exp $

EAPI=5

inherit multilib-build

DESCRIPTION="Virtual for Kerberos V implementation"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~m68k ~mips ppc ppc64 ~s390 ~sh sparc x86 ~amd64-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE=""

DEPEND=""
RDEPEND="
	|| (
		>=app-crypt/mit-krb5-1.12.1-r1[${MULTILIB_USEDEP}]
		>=app-crypt/heimdal-1.5.3-r2[${MULTILIB_USEDEP}]
	)"
