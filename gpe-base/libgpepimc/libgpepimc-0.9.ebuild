# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="1"

GPE_TARBALL_SUFFIX="bz2"
inherit gpe autotools

DESCRIPTION="Common code for PIM applications of the GPE Palmtop Environment"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~arm ~amd64 ~x86"
IUSE="doc"
GPE_DOCS="ChangeLog"
GPECONF="${GPECONF} $(use_enable doc gtk-doc)"

RDEPEND="${RDEPEND}
	x11-libs/gtk+:2
	>=dev-libs/glib-2.2
	gpe-base/libgpewidget
	dev-db/sqlite"

DEPEND="${DEPEND}
	${RDEPEND}
	doc? ( >=dev-util/gtk-doc-1.2 )
	dev-util/gtk-doc-am"

src_unpack() {
	gpe_src_unpack "$@"

	if ! use doc; then
		sed -i -e 's;SUBDIRS = doc;SUBDIRS = ;' Makefile.am \
		|| die "sed failed"
	fi

	eautoreconf
}
