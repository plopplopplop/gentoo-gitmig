# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/blaze-html/blaze-html-0.6.1.1.ebuild,v 1.3 2013/11/24 19:32:50 ago Exp $

EAPI=5

# ebuild generated by hackport 0.3.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="A blazingly fast HTML combinator library for Haskell"
HOMEPAGE="http://jaspervdj.be/blaze"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=dev-haskell/blaze-builder-0.2:=[profile?]
		<dev-haskell/blaze-builder-0.4:=[profile?]
		>=dev-haskell/blaze-markup-0.5.1:=[profile?]
		<dev-haskell/blaze-markup-0.6:=[profile?]
		>=dev-haskell/text-0.10:=[profile?]
		<dev-haskell/text-0.12:=[profile?]
		>=dev-lang/ghc-6.10.4:="
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8
		test? ( =dev-haskell/hunit-1.2*
			>=dev-haskell/quickcheck-2.4
			<dev-haskell/quickcheck-2.7
			>=dev-haskell/test-framework-0.4
			<dev-haskell/test-framework-0.9
			=dev-haskell/test-framework-hunit-0.3*
			=dev-haskell/test-framework-quickcheck2-0.3*
		)"
