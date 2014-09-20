# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/tasty/tasty-0.7.ebuild,v 1.1 2014/03/12 20:55:33 qnikst Exp $

EAPI=5

# ebuild generated by hackport 0.3.4.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Modern and extensible testing framework"
HOMEPAGE="http://hackage.haskell.org/package/tasty"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="+colors"

RDEPEND=">=dev-haskell/deepseq-1.3:=[profile?]
	>=dev-haskell/either-4.0:=[profile?]
	dev-haskell/mtl:=[profile?]
	>=dev-haskell/optparse-applicative-0.6:=[profile?]
	>=dev-haskell/regex-tdfa-1.1.8:=[profile?]
	>=dev-haskell/stm-2.3:=[profile?]
	>=dev-haskell/tagged-0.5:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	colors? ( >=dev-haskell/ansi-terminal-0.6.1:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag colors colors)
}
