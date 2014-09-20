# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/timezone-olson/timezone-olson-0.1.2-r1.ebuild,v 1.1 2012/12/23 19:58:49 slyfox Exp $

EAPI=5

# ebuild generated by hackport 0.3.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="A pure Haskell parser and renderer for binary Olson timezone files"
HOMEPAGE="http://projects.haskell.org/time-ng/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/binary-0.4.1:=[profile?]
		<dev-haskell/binary-0.7:=[profile?]
		>=dev-haskell/extensible-exceptions-0.1.0:=[profile?]
		<dev-haskell/extensible-exceptions-0.2:=[profile?]
		>=dev-lang/ghc-6.10.4:="
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.2"

src_prepare() {
	cabal_chdeps \
		'binary >= 0.4.1 && < 0.6' 'binary >= 0.4.1 && < 0.7'
}
