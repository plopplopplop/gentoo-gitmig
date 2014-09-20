# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=4

# ebuild generated by hackport 0.2.18.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Bindings to the ICU library"
HOMEPAGE="https://bitbucket.org/bos/text-icu"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=dev-haskell/text-0.9.1.0[profile?]
		<=dev-haskell/text-0.12.0.0[profile?]
		>=dev-lang/ghc-6.8.2
		>=dev-libs/icu-4"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"
