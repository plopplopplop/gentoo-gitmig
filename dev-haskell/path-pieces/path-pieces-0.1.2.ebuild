# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=4

# ebuild generated by hackport 0.2.18.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Components of paths"
HOMEPAGE="http://hackage.haskell.org/package/path-pieces"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/text-0.5[profile?]
		<dev-haskell/text-0.12[profile?]
		>=dev-lang/ghc-6.10.1"
DEPEND="${RDEPEND}
		test? ( =dev-haskell/file-location-0.4*
			>=dev-haskell/hspec-1.3
			dev-haskell/hunit
			dev-haskell/quickcheck
		)
		>=dev-haskell/cabal-1.8"
