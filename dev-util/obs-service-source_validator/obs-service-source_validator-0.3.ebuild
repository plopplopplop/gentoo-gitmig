# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/obs-service-source_validator/obs-service-source_validator-0.3.ebuild,v 1.2 2013/06/25 09:33:13 scarabeus Exp $

EAPI=5

inherit obs-service

# only one sanely packed service
SRC_URI="${OBS_URI}/${P}.tar.bz2"

KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-perl/TimeDate"
RDEPEND="${DEPEND}"

src_unpack() {
	default
}

src_install() {
	# different folder and files in this module
	exeinto /usr/libexec/obs/service
	doexe ${OBS_SERVICE_NAME}

	insinto /usr/libexec/obs/service
	doins ${OBS_SERVICE_NAME}.service

	exeinto /usr/libexec/obs/service/${OBS_SERVICE_NAME}s
	doexe [0-9]*
	exeinto /usr/libexec/obs/service/${OBS_SERVICE_NAME}s/helpers/
	doexe helpers/*
}
