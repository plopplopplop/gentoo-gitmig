# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/hspec-meta/hspec-meta-1.8.1.ebuild,v 1.3 2014/03/04 20:02:12 ago Exp $

EAPI=5

# ebuild generated by hackport 0.3.5.9999

CABAL_FEATURES="bin lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="A version of Hspec which is used to test Hspec itself"
HOMEPAGE="http://hspec.github.io/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=dev-haskell/ansi-terminal-0.5:=[profile?]
	dev-haskell/hspec-expectations:=[profile?]
	>=dev-haskell/hunit-1.2.5:=[profile?]
	>=dev-haskell/quickcheck-2.5.1:=[profile?]
	dev-haskell/quickcheck-io:=[profile?]
	>=dev-haskell/random-1.0:=[profile?] <dev-haskell/random-1.1:=[profile?]
	dev-haskell/setenv:=[profile?]
	>=dev-haskell/transformers-0.2.2.0:=[profile?] <dev-haskell/transformers-0.4.0:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
"
