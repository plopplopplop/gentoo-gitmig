# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-xemacs/strokes/strokes-1.10.ebuild,v 1.5 2014/08/10 19:35:37 slyfox Exp $

SLOT="0"
IUSE=""
DESCRIPTION="Mouse enhancement utility"
PKG_CAT="standard"

RDEPEND="app-xemacs/text-modes
app-xemacs/edit-utils
app-xemacs/mail-lib
app-xemacs/xemacs-base
"
KEYWORDS="alpha amd64 ppc ppc64 sparc x86"

inherit xemacs-packages
