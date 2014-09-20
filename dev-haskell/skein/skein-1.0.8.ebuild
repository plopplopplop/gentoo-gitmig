# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/skein/skein-1.0.8.ebuild,v 1.2 2014/07/25 09:16:17 slyfox Exp $

EAPI=5

# ebuild generated by hackport 0.3.4.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Skein, a family of cryptographic hash functions.  Includes Skein-MAC as well"
HOMEPAGE="https://github.com/meteficha/skein"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="big-endian force-endianness reference"

RDEPEND=">=dev-haskell/cereal-0.3:=[profile?] <dev-haskell/cereal-0.5:=[profile?]
	>=dev-haskell/crypto-api-0.6:=[profile?] <dev-haskell/crypto-api-0.13:=[profile?]
	>=dev-haskell/tagged-0.2:=[profile?] <dev-haskell/tagged-0.8:=[profile?]
	>=dev-lang/ghc-6.10.4:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	test? ( >=dev-haskell/hspec-1.3 )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag big-endian big-endian) \
		$(cabal_flag force-endianness force-endianness) \
		$(cabal_flag reference reference)
}
