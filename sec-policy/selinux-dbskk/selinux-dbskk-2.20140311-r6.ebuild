# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-dbskk/selinux-dbskk-2.20140311-r6.ebuild,v 1.1 2014/08/21 19:31:09 swift Exp $
EAPI="5"

IUSE=""
MODS="dbskk"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for dbskk"

KEYWORDS="~amd64 ~x86"
DEPEND="${DEPEND}
	sec-policy/selinux-inetd
"
RDEPEND="${DEPEND}"
