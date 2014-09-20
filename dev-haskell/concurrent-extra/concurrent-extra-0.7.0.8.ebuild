# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

# ebuild generated by hackport 0.4.2.9999

CABAL_FEATURES="lib profile test-suite" # haddock fails for strange reason
inherit haskell-cabal

DESCRIPTION="Extra concurrency primitives"
HOMEPAGE="https://github.com/basvandijk/concurrent-extra"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/base-unicode-symbols-0.1.1:=[profile?] <dev-haskell/base-unicode-symbols-0.3:=[profile?]
	>=dev-haskell/stm-2.1.2.1:=[profile?] <dev-haskell/stm-2.5:=[profile?]
	>=dev-haskell/unbounded-delays-0.1:=[profile?] <dev-haskell/unbounded-delays-0.2:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	test? ( >=dev-haskell/async-2.0 <dev-haskell/async-2.1
		>=dev-haskell/hunit-1.2.2 <dev-haskell/hunit-1.3
		>=dev-haskell/random-1.0 <dev-haskell/random-1.1
		>=dev-haskell/test-framework-0.2.4 <dev-haskell/test-framework-0.9
		>=dev-haskell/test-framework-hunit-0.2.4 <dev-haskell/test-framework-hunit-0.4 )
"
