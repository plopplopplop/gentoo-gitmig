# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php/PEAR-HTTP_Session2/PEAR-HTTP_Session2-0.7.3.ebuild,v 1.3 2014/08/10 20:50:24 slyfox Exp $

inherit php-pear-r1

DESCRIPTION="Wraps PHP's session_* functions, providing extras like db storage for session data"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="minimal"

RDEPEND="${DEPEND}
	!minimal? ( >=dev-php/PEAR-MDB2-2.4.1
			>=dev-php/PEAR-DB-1.7.11 )"
