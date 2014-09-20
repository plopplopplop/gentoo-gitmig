# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

# inherit

DESCRIPTION="The Finite Element ToolKit - Meta package"
HOMEPAGE="http://fetk.org/"
SRC_URI=""

SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
LICENSE="GPL-2"
IUSE=""

RDEPEND="
	~dev-libs/maloc-${PV}
	~sci-libs/punc-${PV}
	~sci-libs/gamer-${PV}
	~sci-libs/mc-${PV}
	~media-libs/sg-${PV}"
DEPEND=""
