# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/hashed-storage/hashed-storage-0.5.11.ebuild,v 1.3 2014/07/25 09:16:25 slyfox Exp $

EAPI=5

# ebuild generated by hackport 0.4.9999

CABAL_FEATURES="bin lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Hashed file storage support code"
HOMEPAGE="http://hackage.haskell.org/package/hashed-storage"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="diff hpc test"

RDEPEND="dev-haskell/binary:=[profile?]
	dev-haskell/dataenc:=[profile?]
	dev-haskell/extensible-exceptions:=[profile?]
	>=dev-haskell/mmap-0.5:=[profile?] <dev-haskell/mmap-0.6:=[profile?]
	dev-haskell/mtl:=[profile?]
	dev-haskell/zlib:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	diff? ( dev-haskell/lcs:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6
	test? ( dev-haskell/hunit:=[profile?]
		>=dev-haskell/quickcheck-2.3:2=[profile?]
		dev-haskell/test-framework:=[profile?]
		dev-haskell/test-framework-hunit:=[profile?]
		dev-haskell/test-framework-quickcheck2:=[profile?]
		dev-haskell/zip-archive:=[profile?] )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag diff diff) \
		$(cabal_flag hpc hpc) \
		$(cabal_flag test test)
}

src_install() {
	haskell-cabal_src_install

	use test && rm "${ED}/usr/bin/hashed-storage-test"
}
