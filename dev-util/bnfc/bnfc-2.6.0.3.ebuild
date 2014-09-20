# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

# ebuild generated by hackport 0.3.2.9999

CABAL_FEATURES="bin lib profile haddock hoogle hscolour"
inherit haskell-cabal

MY_PN="BNFC"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A compiler front-end generator"
HOMEPAGE="http://bnfc.digitalgrammars.com/"
SRC_URI="mirror://hackage/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

RDEPEND="dev-haskell/mtl:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	dev-haskell/alex
	dev-haskell/happy
"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	rm dist/build/bnfc/bnfc-tmp/{LexBNF.hs,ParBNF.hs} || die
}
