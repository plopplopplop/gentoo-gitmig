# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-dropbox/selinux-dropbox-2.20140311-r5.ebuild,v 1.2 2014/08/22 17:40:02 swift Exp $
EAPI="5"

IUSE=""
MODS="dropbox"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for dropbox"

KEYWORDS="amd64 x86"
DEPEND="${DEPEND}
	sec-policy/selinux-xserver
"
RDEPEND="${DEPEND}"
