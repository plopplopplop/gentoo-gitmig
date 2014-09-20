# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/concurrent-extra/concurrent-extra-0.7.0.6.ebuild,v 1.1 2013/06/20 05:14:47 qnikst Exp $

EAPI=5

# ebuild generated by hackport 0.3.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Extra concurrency primitives"
HOMEPAGE="https://github.com/basvandijk/concurrent-extra"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/base-unicode-symbols-0.1.1:=[profile?]
		<dev-haskell/base-unicode-symbols-0.3:=[profile?]
		>=dev-haskell/stm-2.1.2.1:=[profile?]
		<dev-haskell/stm-2.5:=[profile?]
		=dev-haskell/unbounded-delays-0.1*:=[profile?]
		>=dev-lang/ghc-6.10.4:="
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8
		test? ( >=dev-haskell/hunit-1.2.2
			<dev-haskell/hunit-1.3
			>=dev-haskell/test-framework-0.2.4
			<dev-haskell/test-framework-0.9
			>=dev-haskell/test-framework-hunit-0.2.4
			<dev-haskell/test-framework-hunit-0.4
		)"
