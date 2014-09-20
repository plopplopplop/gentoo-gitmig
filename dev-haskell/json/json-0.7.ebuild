# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/json/json-0.7.ebuild,v 1.5 2013/07/21 17:27:50 ottxor Exp $

EAPI=5

# ebuild generated by hackport 0.3.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Support for serialising Haskell to and from JSON"
HOMEPAGE="http://hackage.haskell.org/package/json"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="amd64 ~ppc64 x86 ~amd64-linux"
IUSE="+generic +parsec +pretty"

RDEPEND="dev-haskell/mtl:=[profile?]
		dev-haskell/text:=[profile?]
		parsec? ( dev-haskell/parsec:=[profile?] )
		generic? ( >=dev-haskell/syb-0.3.3:=[profile?] )
		>=dev-lang/ghc-6.10.4:="
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.2.0"

src_configure() {
	[[ $(ghc-version) == "6.12.3" ]] && HCFLAGS+=" -O0" #427838

	cabal_src_configure \
		$(cabal_flag generic) \
		$(cabal_flag parsec) \
		$(cabal_flag pretty)
}
