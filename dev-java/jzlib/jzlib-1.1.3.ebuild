# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-java/jzlib/jzlib-1.1.3.ebuild,v 1.1 2014/05/28 16:40:17 tomwij Exp $

EAPI="4"
JAVA_PKG_IUSE="examples source test"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="JZlib is a re-implementation of zlib in pure Java"
HOMEPAGE="http://www.jcraft.com/jzlib/"
SRC_URI="https://github.com/ymnk/${PN}/archive/${PV}.zip -> ${P}.zip"

LICENSE="BSD"
SLOT="1.1.3"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86 ~x86-fbsd ~x64-freebsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"

RDEPEND="
	>=virtual/jre-1.5"
DEPEND="
	>=virtual/jdk-1.5"
#	test? (
#		dev-lang/scala
#		dev-java/junit:4 )"
# Restrict test due to missing keywords for scala
RESTRICT="test"

S="${WORKDIR}/${P}"
JAVA_SRC_DIR="src/main/java"

java_prepare() {
	rm pom.xml || die
}

src_test() {
	local CP TESTS
	CP="${PN}.jar:$(java-pkg_getjars --with-dependencies scala,junit-4)" || die
	TESTS=$(find src/test/scala -name '*Test.scala' -printf com.jcraft.jzlib. -exec basename {} .scala \;) || die

	mkdir -p target/test || die
	find src/test/scala -name '*.scala' -exec scalac -classpath "${CP}" -d target/test {} + || die
	ejunit4 -classpath "target/test:${CP}" ${TESTS}
}

src_install() {
	java-pkg-simple_src_install
	dodoc README ChangeLog
	use examples && java-pkg_doexamples example
}
