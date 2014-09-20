# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

# ebuild generated by hackport 0.3.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="A simple and intuitive library for automated testing"
HOMEPAGE="https://john-millikin.com/software/chell/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="+color-output"

RDEPEND=">=dev-haskell/options-1.0:=[profile?] <dev-haskell/options-2.0:=[profile?]
	>=dev-haskell/patience-0.1:=[profile?] <dev-haskell/patience-0.2:=[profile?]
	>=dev-haskell/random-1.0:=[profile?]
	dev-haskell/text:=[profile?]
	>=dev-haskell/transformers-0.2:=[profile?]
	>=dev-lang/ghc-6.10.4:=
	color-output? ( >=dev-haskell/ansi-terminal-0.5:=[profile?] <dev-haskell/ansi-terminal-0.7:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6.0.3
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag color-output color-output)
}
