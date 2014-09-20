# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

inherit multilib

DESCRIPTION="A collection of special mathematical functions"
HOMEPAGE="http://julialang.org/"
SRC_URI="
	https://github.com/JuliaLang/openspecfun/archive/v${PV}.tar.gz -> ${P}.tar.gz
	"

LICENSE="MIT public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND="virtual/fortran"
DEPEND="${RDEPEND}"

src_prepare() {
	sed -i "s:/lib:/$(get_libdir):" Make.inc
}

src_install() {
	emake DESTDIR="${D}" prefix="/usr" install
}
