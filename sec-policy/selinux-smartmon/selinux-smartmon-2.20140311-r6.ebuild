# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-smartmon/selinux-smartmon-2.20140311-r6.ebuild,v 1.1 2014/08/21 19:31:08 swift Exp $
EAPI="5"

IUSE=""
MODS="smartmon"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for smartmon"

KEYWORDS="~amd64 ~x86"
