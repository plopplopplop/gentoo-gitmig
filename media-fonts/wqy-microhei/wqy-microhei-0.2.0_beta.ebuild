# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-fonts/wqy-microhei/wqy-microhei-0.2.0_beta.ebuild,v 1.3 2013/02/05 00:55:05 heroxbd Exp $

inherit font

MY_P="${P/_/-}"
DESCRIPTION="A droid derived Sans-Serif style CJK font"
HOMEPAGE="http://wqy.sourceforge.net/en/"
SRC_URI="mirror://sourceforge/wqy/${MY_P}.tar.gz"

LICENSE="Apache-2.0 GPL-3"
SLOT="0"
KEYWORDS="amd64 ~arm x86"
IUSE=""

# Only installs fonts
RESTRICT="strip binchecks"

S="${WORKDIR}/${PN}"
FONT_S="${S}"

FONT_SUFFIX="ttc"
DOCS="AUTHORS.txt ChangeLog.txt README.txt"
