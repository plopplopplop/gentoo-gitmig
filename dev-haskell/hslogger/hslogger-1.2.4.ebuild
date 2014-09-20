# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

# ebuild generated by hackport 0.4.9999

CABAL_FEATURES="bin lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Versatile logging framework"
HOMEPAGE="http://software.complete.org/hslogger"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~sparc ~x86 ~amd64-linux"
IUSE="buildtests"

RDEPEND="dev-haskell/mtl:=[profile?]
	dev-haskell/network:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.2
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag buildtests buildtests)
}
