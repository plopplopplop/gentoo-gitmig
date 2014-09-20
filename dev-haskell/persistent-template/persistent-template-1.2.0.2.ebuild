# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/persistent-template/persistent-template-1.2.0.2.ebuild,v 1.2 2014/07/25 09:16:23 slyfox Exp $

EAPI=5

# ebuild generated by hackport 0.3.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Type-safe, non-relational, multi-backend persistence"
HOMEPAGE="http://www.yesodweb.com/book/persistent"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/aeson:=[profile?]
		>=dev-haskell/monad-control-0.2:=[profile?]
		<dev-haskell/monad-control-0.4:=[profile?]
		dev-haskell/monad-logger:=[profile?]
		=dev-haskell/persistent-1.2*:=[profile?]
		>=dev-haskell/text-0.5:=[profile?]
		<dev-haskell/text-1.0:=[profile?]
		>=dev-haskell/transformers-0.2:=[profile?]
		<dev-haskell/transformers-0.4:=[profile?]
		>=dev-lang/ghc-6.10.4:="
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8
		test? ( >=dev-haskell/hspec-1.3
			dev-haskell/quickcheck
		)"
