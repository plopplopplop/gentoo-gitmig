# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$
EAPI="5"

IUSE=""
MODS="prelude"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for prelude"

KEYWORDS=""
DEPEND="${DEPEND}
	sec-policy/selinux-apache
"
RDEPEND="${DEPEND}"
