# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=4

MODULE_AUTHOR=DLAMBLEY
MODULE_VERSION=${PV%.0}
inherit perl-module

DESCRIPTION="MogileFS Client using AnyEvent non-blocking IO"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-perl/IO-AIO
	dev-perl/AnyEvent
	dev-perl/AnyEvent-HTTP
	dev-perl/File-Slurp
	dev-perl/MogileFS-Client
	dev-perl/Try-Tiny
	dev-perl/namespace-clean"
DEPEND="${RDEPEND}"

# Tests only available if you have a local mogilefsd on 127.0.0.1:7001
#SRC_TEST="do"
