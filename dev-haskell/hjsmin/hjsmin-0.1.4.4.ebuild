# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

# ebuild generated by hackport 0.3.5.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Haskell implementation of a javascript minifier"
HOMEPAGE="http://github.com/alanz/hjsmin"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/blaze-builder-0.2:=[profile?] <dev-haskell/blaze-builder-1:=[profile?]
	>=dev-haskell/language-javascript-0.5.1:=[profile?] <dev-haskell/language-javascript-0.6:=[profile?]
	>=dev-haskell/text-0.8:=[profile?] <dev-haskell/text-1.1:=[profile?]
	>=dev-lang/ghc-6.10.4:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.9.2
	test? ( dev-haskell/hunit
		>=dev-haskell/quickcheck-2 <dev-haskell/quickcheck-3
		dev-haskell/test-framework
		dev-haskell/test-framework-hunit )
"
