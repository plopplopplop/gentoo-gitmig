# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-texlive/texlive-langturkmen/texlive-langturkmen-2012.ebuild,v 1.12 2013/04/25 21:28:51 ago Exp $

EAPI="4"

TEXLIVE_MODULE_CONTENTS="turkmen hyphen-turkmen collection-langturkmen
"
TEXLIVE_MODULE_DOC_CONTENTS="turkmen.doc "
TEXLIVE_MODULE_SRC_CONTENTS="turkmen.source "
inherit  texlive-module
DESCRIPTION="TeXLive Turkmen"

LICENSE="GPL-2 LPPL-1.3 "
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE=""
DEPEND=">=dev-texlive/texlive-basic-2012
"
RDEPEND="${DEPEND} "
