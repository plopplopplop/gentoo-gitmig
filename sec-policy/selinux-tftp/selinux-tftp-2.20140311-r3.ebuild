# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-tftp/selinux-tftp-2.20140311-r3.ebuild,v 1.2 2014/08/01 21:04:46 swift Exp $
EAPI="5"

IUSE=""
MODS="tftp"
BASEPOL="2.20140311-r3"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for tftp"

KEYWORDS="amd64 x86"
