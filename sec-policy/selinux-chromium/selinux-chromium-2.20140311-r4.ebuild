# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$
EAPI="5"

IUSE="alsa"
MODS="chromium"
BASEPOL="2.20140311-r4"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for chromium"

KEYWORDS="~amd64 ~x86"
