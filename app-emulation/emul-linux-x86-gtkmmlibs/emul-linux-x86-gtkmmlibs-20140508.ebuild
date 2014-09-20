# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5
inherit emul-linux-x86

LICENSE="LGPL-2 LGPL-2.1 GPL-2"
KEYWORDS="-* amd64"

DEPEND=""
RDEPEND="~app-emulation/emul-linux-x86-baselibs-${PV}
	~app-emulation/emul-linux-x86-cpplibs-${PV}
	~app-emulation/emul-linux-x86-gtklibs-${PV}"
