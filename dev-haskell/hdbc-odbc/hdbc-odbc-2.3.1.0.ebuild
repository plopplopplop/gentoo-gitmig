# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=4

# ebuild generated by hackport 0.2.18.9999

# haddock is disabled as it chokes in .hsc file:
#     Database/HDBC/ODBC/Statement.hsc:462:3:
#        parse error on input `Word16'
CABAL_FEATURES="bin lib profile hoogle hscolour"
inherit haskell-cabal

MY_PN="HDBC-odbc"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="ODBC driver for HDBC"
HOMEPAGE="http://software.complete.org/hdbc-odbc"
SRC_URI="mirror://hackage/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="2"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="test" # requires configured ODBC

hdbc_PV=$(get_version_component_range 1-2)

RDEPEND="=dev-haskell/hdbc-${hdbc_PV}*[profile?]
		dev-haskell/mtl[profile?]
		dev-haskell/utf8-string[profile?]
		>=dev-lang/ghc-6.12.3
		>=dev-db/unixODBC-2.2
	"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.2.3
		test? ( dev-haskell/convertible
			dev-haskell/hunit
			dev-haskell/quickcheck
			dev-haskell/testpack
		)
	"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	if has_version "<dev-lang/ghc-7.0.1"; then
		# Backport to ghc 6.12.3.
		epatch "${FILESDIR}/${P}-ghc-6.12.patch" || die "Could not apply ${P}-ghc-6.12.patch"
	fi
}

src_configure() {
	cabal_src_configure $(cabal_flag test buildtests)
}

src_test() {
	# default tests
	haskell-cabal_src_test || die "cabal test failed"

	# built custom tests
	"${S}/dist/build/runtests/runtests" || die "unit tests failed"
}

src_install() {
	cabal_src_install

	# if tests were enabled, make sure the unit test driver is deleted
	rm -f "${ED}/usr/bin/runtests"
}
