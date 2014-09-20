# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

HOMEPAGE="http://www.geda.seul.org"
DESCRIPTION="Metapackage which installs all the components required for a full-featured gEDA/gaf system"
IUSE=''
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"

RDEPEND="sci-electronics/geda
	>=sci-electronics/gerbv-1.0.1
	>=sci-electronics/gnucap-0.35
	>=sci-electronics/gwave-20031224
	>=sci-electronics/pcb-20050609
	>=sci-electronics/iverilog-0.8
	sci-electronics/ngspice
	>=sci-electronics/gnetman-0.0.1_pre20041222
	sci-electronics/gtkwave"
