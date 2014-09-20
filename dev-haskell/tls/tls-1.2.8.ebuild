# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/tls/tls-1.2.8.ebuild,v 1.1 2014/07/02 14:09:45 gienah Exp $

EAPI=5

# ebuild generated by hackport 0.4.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="TLS/SSL protocol native implementation (Server and Client)"
HOMEPAGE="http://github.com/vincenthz/hs-tls"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="+compat"

RDEPEND="dev-haskell/asn1-encoding:=[profile?]
	>=dev-haskell/asn1-types-0.2.0:=[profile?]
	dev-haskell/byteable:=[profile?]
	>=dev-haskell/cereal-0.4:=[profile?]
	>=dev-haskell/cipher-aes-0.2:=[profile?] <dev-haskell/cipher-aes-0.3:=[profile?]
	dev-haskell/cipher-des:=[profile?]
	dev-haskell/cipher-rc4:=[profile?]
	>=dev-haskell/crypto-cipher-types-0.0.8:=[profile?]
	dev-haskell/crypto-numbers:=[profile?]
	>=dev-haskell/crypto-pubkey-0.2.4:=[profile?]
	>=dev-haskell/crypto-pubkey-types-0.4:=[profile?]
	>=dev-haskell/crypto-random-0.0:=[profile?] <dev-haskell/crypto-random-0.1:=[profile?]
	>=dev-haskell/cryptohash-0.6:=[profile?]
	dev-haskell/data-default-class:=[profile?]
	dev-haskell/mtl:=[profile?]
	dev-haskell/network:=[profile?]
	>=dev-haskell/x509-1.4.3:=[profile?] <dev-haskell/x509-1.5.0:=[profile?]
	>=dev-haskell/x509-store-1.4.4:=[profile?]
	>=dev-haskell/x509-validation-1.5.0:=[profile?] <dev-haskell/x509-validation-1.6.0:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	test? ( >=dev-haskell/cereal-0.3
		>=dev-haskell/cprng-aes-0.5
		>=dev-haskell/crypto-pubkey-0.2
		dev-haskell/crypto-random
		dev-haskell/data-default-class
		dev-haskell/mtl
		>=dev-haskell/quickcheck-2
		dev-haskell/test-framework
		dev-haskell/test-framework-quickcheck2
		dev-haskell/x509
		dev-haskell/x509-validation )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag compat compat)
}
