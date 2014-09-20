# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/tagstream-conduit/tagstream-conduit-0.5.4.ebuild,v 1.1 2013/09/13 06:35:14 gienah Exp $

EAPI=5

# ebuild generated by hackport 0.3.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="streamlined html tag parser"
HOMEPAGE="http://github.com/yihuang/tagstream-conduit"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/attoparsec:=[profile?]
		>=dev-haskell/attoparsec-conduit-0.5:=[profile?]
		dev-haskell/blaze-builder:=[profile?]
		>=dev-haskell/blaze-builder-conduit-0.5:=[profile?]
		<dev-haskell/blaze-builder-conduit-1.1:=[profile?]
		dev-haskell/case-insensitive:=[profile?]
		>=dev-haskell/conduit-0.5:=[profile?]
		<dev-haskell/conduit-1.1:=[profile?]
		dev-haskell/text:=[profile?]
		>=dev-haskell/transformers-0.3:=[profile?]
		>=dev-lang/ghc-6.10.4:="
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8
		test? ( >=dev-haskell/hspec-1.3
			dev-haskell/hunit
			dev-haskell/quickcheck
		)"
