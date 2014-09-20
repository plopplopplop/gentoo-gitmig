# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-mathematics/agda/agda-2.3.2-r2.ebuild,v 1.1 2012/12/28 05:47:39 gienah Exp $

EAPI=5

# ebuild generated by hackport 0.3.9999

CABAL_FEATURES="lib profile"
inherit haskell-cabal eutils elisp-common

MY_PN="Agda"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A dependently typed functional programming language and proof assistant"
HOMEPAGE="http://wiki.portal.chalmers.se/agda/"
SRC_URI="mirror://hackage/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="epic +stdlib"

RDEPEND=">=dev-haskell/binary-0.4.4:=[profile?]
		<dev-haskell/binary-0.7:=[profile?]
		=dev-haskell/deepseq-1.3*:=[profile?]
		epic? ( dev-lang/epic:=[profile?] )
		>=dev-haskell/geniplate-0.6.0.3:=[profile?]
		<dev-haskell/geniplate-0.7:=[profile?]
		>=dev-haskell/hashable-1.1.2.3:=[profile?]
		<dev-haskell/hashable-1.3:=[profile?]
		=dev-haskell/hashtables-1.0*:=[profile?]
		>=dev-haskell/haskeline-0.6.3.2:=[profile?]
		<dev-haskell/haskeline-0.8:=[profile?]
		>=dev-haskell/haskell-src-exts-1.9.6:=[profile?]
		<dev-haskell/haskell-src-exts-1.14:=[profile?]
		>=dev-haskell/mtl-2.0:=[profile?]
		<dev-haskell/mtl-2.2:=[profile?]
		<dev-haskell/parallel-3.3:=[profile?]
		>=dev-haskell/quickcheck-2.3:=[profile?]
		<dev-haskell/quickcheck-2.6:=[profile?]
		=dev-haskell/text-0.11*:=[profile?]
		=dev-haskell/unordered-containers-0.2*:=[profile?]
		=dev-haskell/xhtml-3000.2*:=[profile?]
		>=dev-haskell/zlib-0.4.0.1:=[profile?]
		<dev-haskell/zlib-0.6:=[profile?]
		>=dev-lang/ghc-6.12.1:=
		virtual/emacs
		app-emacs/haskell-mode"
PDEPEND="stdlib? ( sci-mathematics/agda-stdlib )"
DEPEND="${RDEPEND}
		dev-haskell/alex
		>=dev-haskell/cabal-1.8
		dev-haskell/happy"

SITEFILE="50${PN}2-gentoo.el"
S="${WORKDIR}/${MY_P}"

src_prepare() {
	CABAL_FILE=${MY_PN}.cabal cabal_chdeps \
		'binary >= 0.4.4 && < 0.6' 'binary >= 0.4.4 && < 0.7' \
		'hashable >= 1.1.2.3 && < 1.2' 'hashable >= 1.1.2.3 && < 1.3'
	epatch "${FILESDIR}/${PN}-2.3.2-hashable-1.2.patch"
	sed -e '/.*emacs-mode.*$/d' \
		-e '/^executable agda/,$d' \
		-i "${S}/${MY_PN}.cabal" \
		|| die "Could not remove agda and agda-mode from ${MY_PN}.cabal"
	cabal-mksetup
	if use epic && use stdlib; then
		ewarn "Note that the agda-stdlib README:"
		ewarn "http://www.cse.chalmers.se/~nad/listings/lib/README.html"
		ewarn 'says: "Currently the library does not support the Epic or JavaScript compiler'
		ewarn 'backends." Hence you may wish to remove the epic use flag if you wish to use'
		ewarn "the Agda standard library."
	fi
}

src_configure() {
	cabal_src_configure $(cabal_flag epic)
}

src_install() {
	haskell-cabal_src_install
	elisp-install ${PN} src/data/emacs-mode/*.el \
		|| die "Failed to install emacs mode"
	elisp-site-file-install "${FILESDIR}/${SITEFILE}" \
		|| die "Failed to install elisp site file"
}

pkg_postinst() {
	ghc-package_pkg_postinst
	elisp-site-regen
}

pkg_postrm() {
	ghc-package_pkg_prerm
	elisp-site-regen
}
