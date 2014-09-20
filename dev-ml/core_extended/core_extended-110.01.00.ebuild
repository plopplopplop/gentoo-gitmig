# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ml/core_extended/core_extended-110.01.00.ebuild,v 1.1 2014/02/13 15:57:31 aballier Exp $

EAPI="5"

OASIS_BUILD_DOCS=1
OASIS_BUILD_TESTS=1

inherit oasis

DESCRIPTION="Jane Street's alternative to the standard library"
HOMEPAGE="http://www.janestreet.com/ocaml"
SRC_URI="http://ocaml.janestreet.com/ocaml-core/${PV}/individual/${P}.tar.gz
	http://dev.gentoo.org/~aballier/distfiles/${P}.tar.gz"

LICENSE="LGPL-2.1-with-linking-exception"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=dev-ml/core-${PV}:=
	>=dev-ml/sexplib-109.20.00:=
	>=dev-ml/bin-prot-109.15.00:=
	>=dev-ml/fieldslib-109.20.00:=
	>=dev-ml/pa_ounit-109.27.00:=
	>=dev-ml/comparelib-109.27.00:=
	>=dev-ml/custom_printf-109.27.00:=
	>=dev-ml/pipebang-109.15.00:=
	>=dev-ml/textutils-109.35.00:=
	dev-ml/pa_test:=
	dev-ml/re2:=
	"
DEPEND="${RDEPEND}
	test? ( >=dev-ml/ounit-1.1.0 )"
