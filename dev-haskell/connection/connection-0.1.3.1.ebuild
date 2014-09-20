# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

# ebuild generated by hackport 0.3.5.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Simple and easy network connections API"
HOMEPAGE="http://github.com/vincenthz/hs-connection"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=">=dev-haskell/certificate-1.3.0:=[profile?] <dev-haskell/certificate-1.4.0:=[profile?]
	dev-haskell/cprng-aes:=[profile?]
	dev-haskell/data-default:=[profile?]
	>=dev-haskell/network-2.3:=[profile?]
	>=dev-haskell/socks-0.4:=[profile?]
	>=dev-haskell/tls-1.0:=[profile?] <dev-haskell/tls-1.2:=[profile?]
	>=dev-haskell/tls-extra-0.5:=[profile?] <dev-haskell/tls-extra-0.7:=[profile?]
	>=dev-lang/ghc-6.10.4:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6.0.3
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag test test)
}
