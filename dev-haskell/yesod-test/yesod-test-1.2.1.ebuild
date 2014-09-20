# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/yesod-test/yesod-test-1.2.1.ebuild,v 1.1 2013/09/13 06:52:24 gienah Exp $

EAPI=5

# ebuild generated by hackport 0.3.3.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="integration testing for WAI/Yesod Applications"
HOMEPAGE="http://www.yesodweb.com"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/attoparsec-0.10:=[profile?]
	dev-haskell/blaze-builder:=[profile?]
	>=dev-haskell/blaze-html-0.5:=[profile?]
	>=dev-haskell/blaze-markup-0.5.1:=[profile?]
	>=dev-haskell/case-insensitive-0.2:=[profile?]
	dev-haskell/cookie:=[profile?]
	>=dev-haskell/hspec-1.4:=[profile?]
	>=dev-haskell/html-conduit-0.1:=[profile?]
	>=dev-haskell/http-types-0.7:=[profile?]
	>=dev-haskell/hunit-1.2:=[profile?]
	dev-haskell/monad-control:=[profile?]
	>=dev-haskell/network-2.2:=[profile?]
	>=dev-haskell/persistent-1.0:=[profile?]
	dev-haskell/pool-conduit:=[profile?]
	dev-haskell/text:=[profile?]
	>=dev-haskell/transformers-0.2.2:=[profile?]
	>=dev-haskell/wai-1.3:=[profile?]
	>=dev-haskell/wai-test-1.3:=[profile?]
	>=dev-haskell/xml-conduit-1.0:=[profile?]
	>=dev-haskell/xml-types-0.3:=[profile?]
	>=dev-haskell/yesod-core-1.2:=[profile?]
	>=dev-lang/ghc-7.0.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10.0.0
	test? ( dev-haskell/yesod-form )
"
