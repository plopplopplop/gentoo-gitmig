# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI="5"

JAVA_PKG_IUSE="doc examples source"
PYTHON_COMPAT=( python2_7 )

inherit eutils versionator java-pkg-2 multilib python-r1

MY_PV="${PV/_/-}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Java bindings for GTK and GNOME"
HOMEPAGE="http://java-gnome.sourceforge.net/"
SRC_URI="mirror://gnome/sources/${PN}/$(get_version_component_range 1-2)/${MY_P}.tar.bz2"

LICENSE="GPL-2-with-linking-exception"
SLOT="4.0"
KEYWORDS="~amd64 ~ppc ~x86"

RDEPEND=">=dev-libs/glib-2.22
	>=x11-libs/gtk+-2.22.0:2
	>=gnome-base/libglade-2.6.4
	>=gnome-base/libgnome-2.22.0
	>=gnome-base/gnome-desktop-2.22.0:2
	>=x11-libs/cairo-1.10.0[svg]
	>=x11-libs/gtksourceview-2.6.2:2.0
	>=app-text/gtkspell-2.0.15-r1:2
	>=x11-libs/libnotify-0.4.5
	>=dev-libs/libunique-1.0.8:1
	>=gnome-base/librsvg-2.32.1
	dev-libs/atk
	>=virtual/jre-1.5
	${PYTHON_DEPS}"

DEPEND="${RDEPEND}
	dev-java/junit:0
	dev-lang/perl
	virtual/pkgconfig
	>=virtual/jdk-1.5"

# Needs X11
RESTRICT="test"

S="${WORKDIR}/${MY_P}"

pkg_setup() {
	java-pkg-2_pkg_setup
}

java_prepare() {
	if has_version ">=x11-libs/libnotify-0.7"; then
		epatch "${FILESDIR}"/${P}-libnotify-0.7.patch
	fi

	# From http://permalink.gmane.org/gmane.comp.gnome.bindings.java.devel/1668
	# which has been applied upstream in versions >=4.1.2.
	epatch "${FILESDIR}"/${P}-extendsboxed.patch
}

src_configure() {
	# Handwritten in perl so not using econf
	./configure prefix=/usr libdir=/usr/$(get_libdir)/${PN}-${SLOT} jardir=/usr/share/${PN}-${SLOT}/lib || die
}

src_compile() {
	# Fails parallel build in case GCJ is detected
	# See https://bugs.gentoo.org/show_bug.cgi?id=200550
	emake -j1

	if use doc ; then
		DISPLAY= emake -j1 doc
	fi
}

src_install(){
	emake -j1 DESTDIR="${D}" install
	java-pkg_regjar /usr/share/${PN}-${SLOT}/lib/gtk-${SLOT}.jar
	java-pkg_regjar /usr/share/${PN}-${SLOT}/lib/gtk.jar

	dodoc AUTHORS HACKING NEWS README
	use doc && java-pkg_dojavadoc doc/api
	use examples && java-pkg_doexamples doc/examples
	use source && java-pkg_dosrc src/bindings/org
}
