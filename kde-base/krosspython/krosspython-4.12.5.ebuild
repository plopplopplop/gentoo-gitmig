# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/krosspython/krosspython-4.12.5.ebuild,v 1.5 2014/05/08 07:32:30 ago Exp $

EAPI=5

KMNAME="kross-interpreters"
KMMODULE="python"
PYTHON_COMPAT=( python{2_6,2_7} )
inherit python-single-r1 kde4-meta

DESCRIPTION="Kross scripting framework: Python interpreter"
KEYWORDS="amd64 ~arm ppc ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="debug"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}"

pkg_setup() {
	python-single-r1_pkg_setup
	kde4-meta_pkg_setup
}
