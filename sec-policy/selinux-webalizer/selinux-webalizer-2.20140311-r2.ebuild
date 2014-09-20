# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$
EAPI="4"

IUSE=""
MODS="webalizer"
BASEPOL="2.20140311-r2"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for webalizer"

DEPEND="sec-policy/selinux-apache"
RDEPEND="${DEPEND}"

KEYWORDS="amd64 x86"
