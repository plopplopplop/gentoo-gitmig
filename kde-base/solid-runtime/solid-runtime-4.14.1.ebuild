# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/solid-runtime/solid-runtime-4.14.1.ebuild,v 1.1 2014/09/16 18:17:24 johu Exp $

EAPI=5

KMNAME="kde-runtime"
KMNOMODULE=true
inherit kde4-meta

DESCRIPTION="KDE SC solid runtime modules (autoeject, automounter and others)"
HOMEPAGE="http://solid.kde.org"
KEYWORDS=" ~amd64 ~arm ~ppc ~ppc64 ~x86 ~x86-fbsd ~amd64-linux ~x86-linux"
IUSE="debug bluetooth networkmanager"

KMEXTRA="
	solid-device-automounter/
	solid-hardware/
	solid-networkstatus/
	solidautoeject/
	soliduiserver/
"

DEPEND=""
RDEPEND="${DEPEND}
	bluetooth? ( net-wireless/bluedevil )
	networkmanager? ( || ( kde-misc/plasma-nm kde-misc/networkmanagement ) )
"
