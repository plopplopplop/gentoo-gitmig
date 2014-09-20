# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="5"

inherit vcs-snapshot

DESCRIPTION="cron script to sync portage and send update mails to root"
HOMEPAGE="http://github.com/hollow/porticron"
SRC_URI="https://github.com/hollow/${PN}/tarball/df727fe -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND="net-dns/bind-tools"
DEPEND=""

src_install() {
	dosbin bin/porticron
	insinto /etc
	doins etc/porticron.conf
}
