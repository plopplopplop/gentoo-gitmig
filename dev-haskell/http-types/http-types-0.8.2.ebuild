# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

# ebuild generated by hackport 0.3.4.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Generic HTTP types for Haskell (for both client and server code)"
HOMEPAGE="https://github.com/aristidb/http-types"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=dev-haskell/blaze-builder-0.2.1.4:=[profile?] <dev-haskell/blaze-builder-0.4:=[profile?]
	>=dev-haskell/case-insensitive-0.2:=[profile?] <dev-haskell/case-insensitive-1.2:=[profile?]
	>=dev-haskell/text-0.11.0.2:=[profile?] <dev-haskell/text-0.12:=[profile?]
	>=dev-lang/ghc-6.12.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8.0.2
	test? ( >=dev-haskell/hspec-1.3
		dev-haskell/quickcheck )
"
