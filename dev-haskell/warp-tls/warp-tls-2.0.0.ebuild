# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

# ebuild generated by hackport 0.3.5.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="HTTP over SSL/TLS support for Warp via the TLS package"
HOMEPAGE="http://github.com/yesodweb/wai"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/certificate-1.2:=[profile?]
	>=dev-haskell/conduit-0.5:=[profile?] <dev-haskell/conduit-1.1:=[profile?]
	>=dev-haskell/crypto-random-api-0.2:=[profile?]
	>=dev-haskell/cryptocipher-0.3:=[profile?]
	>=dev-haskell/network-2.2.1:=[profile?]
	>=dev-haskell/network-conduit-0.6:=[profile?] <dev-haskell/network-conduit-1.1:=[profile?]
	>=dev-haskell/pem-0.1:=[profile?]
	>=dev-haskell/tls-extra-0.6:=[profile?]
	>=dev-haskell/transformers-0.2:=[profile?]
	>=dev-haskell/wai-2.0:=[profile?] <dev-haskell/wai-2.1:=[profile?]
	>=dev-haskell/warp-2.0:=[profile?] <dev-haskell/warp-2.1:=[profile?]
	>=dev-lang/ghc-6.10.4:=
	>=dev-haskell/cprng-aes-0.5.0:=[profile?]
	>=dev-haskell/tls-1.1.3:=[profile?]
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6.0.3
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=tls_1_1_3
}
