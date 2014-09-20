# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

USE_RUBY="ruby18 ruby19 ruby20"
PYTHON_COMPAT=( python{2_7,3_3} )
inherit cmake-utils python-single-r1 python-utils-r1 eutils multilib

DESCRIPTION="File transfer over OBEX for mobile phones"
HOMEPAGE="http://dev.zuckschwerdt.org/openobex/wiki/ObexFtp"
SRC_URI="mirror://sourceforge/openobex/${P}-Source.tar.gz"
SLOT="0"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~hppa ~ppc ~sparc ~x86"
IUSE="bluetooth perl python ruby tcl"

RDEPEND="
	>=dev-libs/openobex-1.7
	bluetooth? ( net-wireless/bluez )
	perl? ( dev-lang/perl )
	python? ( ${PYTHON_DEPS} )
	ruby? ( dev-lang/ruby )
	tcl? ( dev-lang/tcl )
"
DEPEND="
	${RDEPEND}
	perl? ( dev-lang/swig )
	python? ( dev-lang/swig )
	ruby? ( dev-lang/swig )
	tcl? ( dev-lang/swig )
	virtual/pkgconfig
"

S=${WORKDIR}/${P}-Source

DOCS=( AUTHORS ChangeLog NEWS README THANKS TODO )

PATCHES=(
	"${FILESDIR}"/${PN}-0.23-gentoo.patch
	"${FILESDIR}"/${PN}-0.24-config.patch
	"${FILESDIR}"/${PN}-0.24-enable_bluetooth.patch
	"${FILESDIR}"/${PN}-0.24-python_sitedir.patch
)

src_configure() {
	local mycmakeargs=(
		-DENABLE_PERL=$(usex perl)
		-DENABLE_BLUETOOTH=$(usex bluetooth)
		-DENABLE_PYTHON=$(usex python)
		$(usex python -DPYTHON_SITE_DIR=$(python_get_sitedir) '')
		-DENABLE_RUBY=$(usex ruby)
		-DENABLE_TCL=$(usex tcl)
	)

	cmake-utils_src_configure
}
