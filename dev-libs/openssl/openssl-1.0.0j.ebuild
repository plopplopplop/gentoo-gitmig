# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="This is a fake ebuild to support libressl"
HOMEPAGE="http://www.openssl.org/"
SRC_URI=""

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="static-libs bindist"

DEPEND=">=dev-libs/libressl-2.0.0[static-libs?]"
RDEPEND="${DEPEND}"
