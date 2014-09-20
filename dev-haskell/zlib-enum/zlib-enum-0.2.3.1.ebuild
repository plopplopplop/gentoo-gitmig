# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

# ebuild generated by hackport 0.4.9999
#hackport: flags: -test

CABAL_FEATURES="bin lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Enumerator interface for zlib compression"
HOMEPAGE="http://github.com/maltem/zlib-enum"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/enumerator-0.4:=[profile?] <dev-haskell/enumerator-0.5:=[profile?]
	>=dev-haskell/transformers-0.2:=[profile?] <dev-haskell/transformers-0.5:=[profile?]
	>=dev-haskell/zlib-bindings-0.1:=[profile?] <dev-haskell/zlib-bindings-0.2:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=-test
}
