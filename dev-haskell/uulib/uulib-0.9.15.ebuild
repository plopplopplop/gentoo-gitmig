# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/uulib/uulib-0.9.15.ebuild,v 1.1 2014/02/21 19:58:31 slyfox Exp $

EAPI=5

# ebuild generated by hackport 0.3.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Haskell Utrecht Tools Library"
HOMEPAGE="http://www.cs.uu.nl/wiki/HUT/WebHome"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND=">=dev-lang/ghc-6.12.1:="
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"
