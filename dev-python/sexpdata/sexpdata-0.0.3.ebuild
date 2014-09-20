# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/sexpdata/sexpdata-0.0.3.ebuild,v 1.1 2014/05/10 02:25:22 jauhien Exp $

EAPI=5

PYTHON_COMPAT=(python{2_6,2_7,3_2,3_3})

inherit distutils-r1

DESCRIPTION="a simple S-expression parser/serializer"
HOMEPAGE="http://github.com/tkf/sexpdata"
SRC_URI="https://github.com/tkf/sexpdata/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""
