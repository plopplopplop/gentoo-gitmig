# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} pypy )

inherit distutils-r1

KEYWORDS="~amd64 ~x86"
DESCRIPTION="Python FUSE bindings"
HOMEPAGE="http://fuse.sourceforge.net/wiki/index.php/FusePython"

SRC_URI="mirror://sourceforge/fuse/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND=">=sys-fs/fuse-2.0"
DEPEND="${RDEPEND}"
