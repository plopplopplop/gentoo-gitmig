# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/text-stream-decode/text-stream-decode-0.1.0.4.ebuild,v 1.2 2014/07/25 09:16:47 slyfox Exp $

EAPI=5

# ebuild generated by hackport 0.3.6.9999
#hackport: flags: +text11

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Streaming decoding functions for UTF encodings"
HOMEPAGE="http://github.com/fpco/text-stream-decode"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/text-1.1:=[profile?]
	>=dev-lang/ghc-6.10.4:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	test? ( dev-haskell/deepseq
		>=dev-haskell/hspec-1.8 )
"

src_configure() {
	haskell-cabal_src_configure \
		--flag=text11
}
