# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/html-conduit/html-conduit-1.1.0.1.ebuild,v 1.2 2014/07/25 09:16:36 slyfox Exp $

EAPI=5

# ebuild generated by hackport 0.3.4.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Parse HTML documents using xml-conduit datatypes"
HOMEPAGE="https://github.com/snoyberg/xml"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT=test # 1) parses doesn't strip whitespace

RDEPEND=">=dev-haskell/conduit-1.0:=[profile?] <dev-haskell/conduit-1.1:=[profile?]
	>=dev-haskell/filesystem-conduit-1.0:=[profile?]
	>=dev-haskell/resourcet-0.3:=[profile?] <dev-haskell/resourcet-0.5:=[profile?]
	>=dev-haskell/system-filepath-0.4:=[profile?] <dev-haskell/system-filepath-0.5:=[profile?]
	>=dev-haskell/tagstream-conduit-0.4:=[profile?] <dev-haskell/tagstream-conduit-0.6:=[profile?]
	dev-haskell/text:=[profile?]
	dev-haskell/transformers:=[profile?]
	>=dev-haskell/xml-conduit-1.1:=[profile?] <dev-haskell/xml-conduit-1.2:=[profile?]
	>=dev-haskell/xml-types-0.3:=[profile?] <dev-haskell/xml-types-0.4:=[profile?]
	>=dev-lang/ghc-6.10.4:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
	test? ( >=dev-haskell/hspec-1.3
		dev-haskell/hunit )
"
