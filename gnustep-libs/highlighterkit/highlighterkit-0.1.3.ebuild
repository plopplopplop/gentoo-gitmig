# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnustep-libs/highlighterkit/highlighterkit-0.1.3.ebuild,v 1.1 2014/02/10 09:34:31 voyageur Exp $

EAPI=5
inherit gnustep-2

MY_P="HighlighterKit-${PV}"

DESCRIPTION="Syntax highlighter framework"
HOMEPAGE="http://wiki.gnustep.org/index.php/HighlighterKit"
SRC_URI="http://download.gna.org/gnustep-nonfsf/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

S="${WORKDIR}/${MY_P}"
