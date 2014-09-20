# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

# WARNING: JUNIT.JAR IS _NOT_ SYMLINKED TO ANT-CORE LIB FOLDER AS JUNIT3 IS

EAPI="5"

JAVA_PKG_IUSE="doc examples source test"

inherit java-pkg-2 java-ant-2

DESCRIPTION="Simple framework to write repeatable tests"
SRC_URI="mirror://github/${PN}-team/${PN}/${PN}${PV}.zip"
HOMEPAGE="http://www.junit.org/"

LICENSE="CPL-1.0"
SLOT="4"

KEYWORDS="amd64 ppc ppc64 x86 ~amd64-fbsd ~x86-fbsd ~x64-freebsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"

CDEPEND="dev-java/hamcrest-core:1.3"

RDEPEND=">=virtual/jre-1.5
	${CDEPEND}"

DEPEND=">=virtual/jdk-1.5
	userland_GNU? ( >=sys-apps/findutils-4.3 )
	${CDEPEND}"

S="${WORKDIR}/${PN}${PV}"

EANT_BUILD_TARGET="jars samples-and-tests"

src_unpack() {
	default

	# Unpack the source JAR.
	mkdir -p "${S}/src/main/java" "${S}/src/test/java" \
		|| die "Unable to create source directories"

	pushd "${S}/src/main/java" > /dev/null
		jar xf "${S}/${P}-src.jar" || die "Unable to unpack sources."
	popd >/dev/null

	# Copy the Gentoo manifest to the working directory.
	cp "${FILESDIR}/gentoo-manifest.mf" "${S}" || die
}

java_prepare() {
	epatch "${FILESDIR}"/${P}-do-not-unpack-hamcrest-sources.patch

	mkdir lib || die
	java-pkg_jar-from --into lib hamcrest-core{-1.3,.jar,-1.3.jar}

	# Fix javadoc compilation.
	if use doc ; then
		cp "${S}"/javadoc/stylesheet.css "${S}" \
			|| die "Unable to copy Javdoc stylesheet"
	fi

	# Remove binary and other generated files.
	rm -rf javadoc temp.hamcrest.source *.jar \
		|| die "Unable to clean generated files."
	find . -name "*.class" -delete \
		|| die "Unable to remove distributed class files"

	# Let Ant know where its hamcrest went.
	EANT_EXTRA_ARGS="-Dhamcrestlib=$(java-pkg_getjars hamcrest-core-1.3)"

	# Add Gentoo manifest information to generated JAR files.
	java-ant_xml-rewrite -f build.xml -c \
		-e jar -a manifest -v "gentoo-manifest.mf"
}

src_test() {
	mkdir classes || die "Unable to create build directory for tests."

	local cp=$(java-pkg_getjars hamcrest-core-1.3):"${S}"/target/main

	ejavac -classpath ${cp} \
		-d classes $(find org/junit/internal -name "*.java")
	ejavac -classpath ${cp}:"${S}/classes" \
		-d classes $(find junit/tests org/junit/tests -name "*.java")

	java -classpath ${cp}:classes \
		org.junit.runner.JUnitCore junit.tests.AllTests || die "Tests failed."
}

src_install() {
	java-pkg_newjar ${PN}${PV}-SNAPSHOT/${PN}-dep-${PV}-SNAPSHOT.jar
	dodoc README.html doc/ReleaseNotes${PV}.txt

	use examples && java-pkg_doexamples org/junit/samples
	use source && java-pkg_dosrc src/main/java/org src/main/java/junit

	if use doc; then
		dohtml -r doc/*
		java-pkg_dojavadoc ${PN}${PV}-SNAPSHOT/javadoc
	fi
}
