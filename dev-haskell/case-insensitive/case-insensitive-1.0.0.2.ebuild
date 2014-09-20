# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/case-insensitive/case-insensitive-1.0.0.2.ebuild,v 1.3 2013/08/18 13:45:25 ago Exp $

EAPI=5

# ebuild generated by hackport 0.3.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Case insensitive string comparison"
HOMEPAGE="https://github.com/basvandijk/case-insensitive"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=dev-haskell/deepseq-1.1:=[profile?]
		<dev-haskell/deepseq-1.4:=[profile?]
		>=dev-haskell/hashable-1.0:=[profile?]
		<dev-haskell/hashable-1.3:=[profile?]
		>=dev-haskell/text-0.3:=[profile?]
		<dev-haskell/text-0.12:=[profile?]
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
