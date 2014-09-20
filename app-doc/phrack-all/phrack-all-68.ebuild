# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-doc/phrack-all/phrack-all-68.ebuild,v 1.3 2014/06/08 17:20:20 ulm Exp $

MY_P=${PN}${PV}
DESCRIPTION="Hacker magazine by the community, for the community (this will install *all* issues of phrack)"
HOMEPAGE="http://www.phrack.org/"
SRC_URI=""

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos"
IUSE=""

RDEPEND=$(printf '=app-doc/phrack-%02i ' {1..68})
