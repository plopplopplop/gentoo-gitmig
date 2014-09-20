# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/statistics/statistics-0.10.4.1.ebuild,v 1.1 2013/08/25 06:40:53 qnikst Exp $

EAPI=5

# ebuild generated by hackport 0.3.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="A library of statistical types, data, and functions"
HOMEPAGE="https://github.com/bos/statistics"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/binary-0.6.3.0:=[profile?]
		>=dev-haskell/deepseq-1.1.0.2:=[profile?]
		dev-haskell/erf:=[profile?]
		>=dev-haskell/math-functions-0.1.2:=[profile?]
		>=dev-haskell/monad-par-0.3.4:=[profile?]
		>=dev-haskell/mwc-random-0.11.0.0:=[profile?]
		>=dev-haskell/primitive-0.3:=[profile?]
		>=dev-haskell/vector-0.7.1:=[profile?]
		>=dev-haskell/vector-algorithms-0.4:=[profile?]
		>=dev-haskell/vector-binary-instances-0.2.1:=[profile?]
		>=dev-lang/ghc-6.10.4:="
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8
		test? ( dev-haskell/hunit
			>=dev-haskell/ieee754-0.7.3
			>=dev-haskell/quickcheck-2
			dev-haskell/test-framework
			dev-haskell/test-framework-hunit
			dev-haskell/test-framework-quickcheck2
		)"
RESTRICT=test # likes to fail under a load
