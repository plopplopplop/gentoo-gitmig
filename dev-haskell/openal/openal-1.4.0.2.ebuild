# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/openal/openal-1.4.0.2.ebuild,v 1.4 2014/08/01 09:50:23 armin76 Exp $

EAPI=5

# ebuild generated by hackport 0.3.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

MY_PN="OpenAL"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A binding to the OpenAL cross-platform 3D audio API"
HOMEPAGE="http://connect.creativelabs.com/openal/"
SRC_URI="mirror://hackage/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS=" amd64 x86"
IUSE=""

RDEPEND="dev-haskell/objectname:=[profile?]
		dev-haskell/statevar:=[profile?]
		dev-haskell/tensor:=[profile?]
		media-libs/openal
		>=dev-lang/ghc-6.10.4:="
DEPEND="${RDEPEND}
		dev-haskell/cabal"

S="${WORKDIR}/${MY_P}"
