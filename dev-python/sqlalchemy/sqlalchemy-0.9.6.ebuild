# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/sqlalchemy/sqlalchemy-0.9.6.ebuild,v 1.1 2014/07/04 05:55:19 patrick Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3,3_4} pypy pypy2_0 )
PYTHON_REQ_USE="sqlite?"

inherit distutils-r1 eutils flag-o-matic

MY_PN="SQLAlchemy"
MY_P="${MY_PN}-${PV/_}"

DESCRIPTION="Python SQL toolkit and Object Relational Mapper"
HOMEPAGE="http://www.sqlalchemy.org/ http://pypi.python.org/pypi/SQLAlchemy"
SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos"
IUSE="doc examples +sqlite test"
REQUIRED_USE="test? ( sqlite )"

RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		sqlite? ( >=dev-db/sqlite-3.3.13 )"

DEPEND="${RDEPEND}
	test? (
		>=dev-db/sqlite-3.3.13
		>=dev-python/nose-0.10.4[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
	)"
S="${WORKDIR}/${MY_P}"

python_prepare_all() {
	# Disable tests hardcoding function call counts specific to Python versions.
	rm -r test/aaa_profiling || die
	distutils-r1_python_prepare_all
}

python_compile() {
	if ! python_is_python3; then
		local CFLAGS=${CFLAGS}
		append-cflags -fno-strict-aliasing
	fi
	distutils-r1_python_compile
}

python_test() {
	# Create copies of necessary files in BUILD_DIR.
	cp -pR examples sqla_nose.py setup.cfg test "${BUILD_DIR}" || die
	pushd "${BUILD_DIR}" > /dev/null
	if [[ "${EPYTHON}" == "python3.2" ]]; then
		2to3 --no-diffs -w test
		"${PYTHON}" sqla_nose.py -e test_reflect || die "Testsuite failed under ${EPYTHON}"
	else
		"${PYTHON}" sqla_nose.py || die "Testsuite failed under ${EPYTHON}"
	fi
	popd > /dev/null
}

python_install_all() {
	use doc && HTML_DOCS=( doc/. )

	use examples && local EXAMPLES=( examples/. )

	distutils-r1_python_install_all
}

pkg_postinst() {
	if [[ -z ${REPLACING_VERSIONS} ]]; then
		if ! has_version dev-python/mysql-python; then
		        elog "For MySQL support, install dev-python/mysql-python"
		fi

		if ! has_version dev-python/pymssql; then
			elog "For mssql support, install dev-python/pymssql"
		fi

		if ! has_version dev-python/psycopg:2; then
			elog "For postgresql support, install dev-python/psycopg:2"
		fi
	fi
}
