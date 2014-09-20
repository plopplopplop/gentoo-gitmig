# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/lttng-tools/lttng-tools-2.4.1.ebuild,v 1.1 2014/05/16 08:11:23 dlan Exp $

EAPI=5

inherit linux-info

MY_P="${P/_rc/-rc}"
DESCRIPTION="Linux Trace Toolkit - next generation"
HOMEPAGE="http://lttng.org"
SRC_URI="http://lttng.org/files/${PN}/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+ust"

DEPEND="dev-libs/userspace-rcu
	dev-libs/popt
	ust? ( dev-util/lttng-ust )
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

pkg_pretend() {
	if kernel_is -lt 2 6 27; then
		ewarn "${PN} require Linux kernel >= 2.6.27"
		ewarn "   pipe2(), epoll_create1() and SOCK_CLOEXEC are needed to run"
		ewarn "   the session daemon. There were introduce in the 2.6.27"
	fi
}

src_configure() {
	econf $(use_enable ust lttng-ust)
}
