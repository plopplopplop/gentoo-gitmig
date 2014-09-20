# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/pcre-light/pcre-light-0.4.ebuild,v 1.3 2013/07/21 17:21:57 ottxor Exp $

# ebuild generated by hackport 0.2.13

EAPI="3"

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="A small, efficient and portable regex library for Perl 5 compatible regular expressions"
HOMEPAGE="http://code.haskell.org/~dons/code/pcre-light"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux"
IUSE=""

RDEPEND=">=dev-lang/ghc-6.8.2
		dev-libs/libpcre"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.2.0"
