# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/monadcatchio-mtl/monadcatchio-mtl-0.3.0.5.ebuild,v 1.7 2013/09/07 20:12:32 ago Exp $

EAPI=5

# ebuild generated by hackport 0.3.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

MY_PN="MonadCatchIO-mtl"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Monad-transformer version of the Control.Exception module"
HOMEPAGE="http://darcsden.com/jcpetruzza/MonadCatchIO-mtl"
SRC_URI="mirror://hackage/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="alpha amd64 ppc sparc x86"
IUSE=""

RDEPEND="dev-haskell/extensible-exceptions:=[profile?]
		dev-haskell/mtl:=[profile?]
		>=dev-lang/ghc-6.10.4:="
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.2"

S="${WORKDIR}/${MY_P}"
