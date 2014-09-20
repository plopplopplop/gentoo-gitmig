# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

# ebuild generated by hackport 0.3.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="X509 reader and writer"
HOMEPAGE="http://github.com/vincenthz/hs-certificate"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/asn1-encoding-0.8:=[profile?] <dev-haskell/asn1-encoding-0.9:=[profile?]
	>=dev-haskell/asn1-parse-0.8:=[profile?] <dev-haskell/asn1-parse-0.9:=[profile?]
	>=dev-haskell/asn1-types-0.2:=[profile?] <dev-haskell/asn1-types-0.3:=[profile?]
	>=dev-haskell/crypto-pubkey-types-0.4.2.1:=[profile?] <dev-haskell/crypto-pubkey-types-0.5:=[profile?]
	>=dev-haskell/cryptohash-0.9:=[profile?] <dev-haskell/cryptohash-0.12:=[profile?]
	dev-haskell/mtl:=[profile?]
	>=dev-haskell/pem-0.1:=[profile?] <dev-haskell/pem-0.3:=[profile?]
	>=dev-lang/ghc-6.12.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8.0.2
	test? ( dev-haskell/hunit
		>=dev-haskell/quickcheck-2
		dev-haskell/test-framework
		dev-haskell/test-framework-hunit
		dev-haskell/test-framework-quickcheck2 )
"
