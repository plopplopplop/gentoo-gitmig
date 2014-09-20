# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kdebindings-meta/kdebindings-meta-4.14.1.ebuild,v 1.1 2014/09/16 18:17:28 johu Exp $

EAPI=5
inherit kde4-meta-pkg

DESCRIPTION="KDE bindings - merge this to pull in all kdebindings-derived packages"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="csharp java perl python ruby"

RDEPEND="
	$(add_kdebase_dep smokegen)
	$(add_kdebase_dep smokekde)
	$(add_kdebase_dep smokeqt)
	csharp? (
		$(add_kdebase_dep kimono)
		$(add_kdebase_dep qyoto)
	)
	java? ( $(add_kdebase_dep krossjava) )
	perl? (
		$(add_kdebase_dep perlkde)
		$(add_kdebase_dep perlqt)
	)
	python? (
		$(add_kdebase_dep krosspython)
		$(add_kdebase_dep pykde4)
	)
	ruby? (
		$(add_kdebase_dep korundum)
		$(add_kdebase_dep krossruby)
		$(add_kdebase_dep qtruby)
	)
"
