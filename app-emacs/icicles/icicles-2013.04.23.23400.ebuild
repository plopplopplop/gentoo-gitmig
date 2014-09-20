# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

inherit elisp

DESCRIPTION="Minibuffer input completion and cycling"
HOMEPAGE="http://www.emacswiki.org/cgi-bin/wiki/Icicles"
SRC_URI="https://github.com/emacsmirror/icicles/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

SITEFILE="50${PN}-gentoo.el"
