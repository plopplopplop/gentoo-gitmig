# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php/PEAR-MDB2_Driver_mysqli/PEAR-MDB2_Driver_mysqli-1.5.0_beta4.ebuild,v 1.1 2013/11/03 21:11:15 mabi Exp $

EAPI="5"

inherit php-pear-r1

DESCRIPTION="Database Abstraction Layer, mysqli driver"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""

DEPEND=">=dev-php/PEAR-MDB2-2.5.0_beta3
		dev-lang/php[mysqli]"
RDEPEND="${DEPEND}"
