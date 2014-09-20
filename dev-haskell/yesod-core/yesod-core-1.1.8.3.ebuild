# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/yesod-core/yesod-core-1.1.8.3.ebuild,v 1.2 2014/07/25 09:16:31 slyfox Exp $

EAPI=5

# ebuild generated by hackport 0.3.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Creation of type-safe, RESTful web applications"
HOMEPAGE="http://www.yesodweb.com/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/aeson-0.5:=[profile?]
		>=dev-haskell/blaze-builder-0.2.1.4:=[profile?]
		<dev-haskell/blaze-builder-0.4:=[profile?]
		>=dev-haskell/blaze-html-0.5:=[profile?]
		>=dev-haskell/blaze-markup-0.5.1:=[profile?]
		>=dev-haskell/case-insensitive-0.2:=[profile?]
		=dev-haskell/cereal-0.3*:=[profile?]
		>=dev-haskell/clientsession-0.8:=[profile?]
		>=dev-haskell/conduit-0.5:=[profile?]
		=dev-haskell/cookie-0.4*:=[profile?]
		=dev-haskell/failure-0.2*:=[profile?]
		>=dev-haskell/fast-logger-0.2:=[profile?]
		=dev-haskell/hamlet-1.1*:=[profile?]
		>=dev-haskell/http-types-0.7:=[profile?]
		>=dev-haskell/lifted-base-0.1:=[profile?]
		=dev-haskell/monad-control-0.3*:=[profile?]
		>=dev-haskell/monad-logger-0.2.1:=[profile?]
		<dev-haskell/monad-logger-0.4:=[profile?]
		>=dev-haskell/parsec-2:=[profile?]
		<dev-haskell/parsec-3.2:=[profile?]
		>=dev-haskell/path-pieces-0.1.2:=[profile?]
		<dev-haskell/path-pieces-0.2:=[profile?]
		>=dev-haskell/random-1.0.0.2:=[profile?]
		<dev-haskell/random-1.1:=[profile?]
		>=dev-haskell/resourcet-0.3:=[profile?]
		<dev-haskell/resourcet-0.5:=[profile?]
		=dev-haskell/shakespeare-1.0*:=[profile?]
		=dev-haskell/shakespeare-css-1.0*:=[profile?]
		=dev-haskell/shakespeare-i18n-1.0*:=[profile?]
		>=dev-haskell/shakespeare-js-1.0.2:=[profile?]
		<dev-haskell/shakespeare-js-1.2:=[profile?]
		>=dev-haskell/text-0.7:=[profile?]
		<dev-haskell/text-0.12:=[profile?]
		>=dev-haskell/transformers-0.2.2:=[profile?]
		<dev-haskell/transformers-0.4:=[profile?]
		>=dev-haskell/transformers-base-0.4:=[profile?]
		>=dev-haskell/vector-0.9:=[profile?]
		<dev-haskell/vector-0.11:=[profile?]
		>=dev-haskell/wai-1.3:=[profile?]
		<dev-haskell/wai-1.5:=[profile?]
		=dev-haskell/wai-extra-1.3*:=[profile?]
		=dev-haskell/yesod-routes-1.1*:=[profile?]
		>=dev-lang/ghc-7.0.1:="
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8
		test? ( >=dev-haskell/hspec-1.3
			dev-haskell/hunit
			=dev-haskell/quickcheck-2*
			dev-haskell/wai-test:=[profile?]
		)"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag test test)
}
