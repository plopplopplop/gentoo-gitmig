# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="3"
PYTHON_DEPEND="2"

inherit distutils

DESCRIPTION="GTK+ GUI for the rdiff-backup tool"
HOMEPAGE="http://sucs.org/~davea/trac/wiki"
SRC_URI="http://minus-zero.org/projects/pybackpack/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~ppc"
IUSE=""

DEPEND=">=app-backup/rdiff-backup-0.12.7
	dev-python/libgnome-python
	dev-python/gnome-vfs-python
	dev-python/pygobject:2
	dev-python/pygtk:2"
RDEPEND="${DEPEND}"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}
