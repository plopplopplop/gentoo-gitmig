# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

inherit eutils multilib multilib-minimal portability toolchain-funcs versionator

DESCRIPTION="A powerful light-weight programming language designed for extending applications"
HOMEPAGE="http://www.lua.org/"
SRC_URI="http://www.lua.org/ftp/${P}.tar.gz"

LICENSE="MIT"
SLOT="5.1"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~arm-linux ~x86-linux"
IUSE="+deprecated emacs readline static"

RDEPEND="readline? ( >=sys-libs/readline-6.2_p5-r1[${MULTILIB_USEDEP}] )
	app-admin/eselect-lua
	!dev-lang/lua:0"
DEPEND="${RDEPEND}
	sys-devel/libtool"
PDEPEND="emacs? ( app-emacs/lua-mode )"

SAN_SLOT="${SLOT//.}"

MULTILIB_WRAPPED_HEADERS=(
	/usr/include/lua${SLOT}/luaconf.h
)

src_prepare() {
	local PATCH_PV=$(get_version_component_range 1-2)

	epatch "${FILESDIR}"/${PN}-${PATCH_PV}-make-r2.patch
	epatch "${FILESDIR}"/${PN}-${PATCH_PV}-module_paths.patch

	#EPATCH_SOURCE="${FILESDIR}/${PV}" EPATCH_SUFFIX="upstream.patch" epatch

	# correct lua versioning
	sed -i -e 's/\(LIB_VERSION = \)6:1:1/\16:5:1/' src/Makefile

	sed -i -e 's:\(/README\)\("\):\1.gz\2:g' doc/readme.html

	if ! use deprecated ; then
		# patches from 5.1.4 still apply
		epatch "${FILESDIR}"/${PN}-5.1.4-deprecated.patch
		epatch "${FILESDIR}"/${PN}-5.1.4-test.patch
	fi

	if ! use readline ; then
		epatch "${FILESDIR}"/${PN}-${PATCH_PV}-readline.patch
	fi

	# Using dynamic linked lua is not recommended for performance
	# reasons. http://article.gmane.org/gmane.comp.lang.lua.general/18519
	# Mainly, this is of concern if your arch is poor with GPRs, like x86
	# Note that this only affects the interpreter binary (named lua), not the lua
	# compiler (built statically) nor the lua libraries (both shared and static
	# are installed)
	if use static ; then
		epatch "${FILESDIR}"/${PN}-${PATCH_PV}-make_static-r1.patch
	fi

	# custom Makefiles
	multilib_copy_sources
}

multilib_src_configure() {
	# We want packages to find our things...
	sed -i \
		-e 's:/usr/local:'${EPREFIX}'/usr:' \
		-e "s:\([/\"]\)\<lib\>:\1$(get_libdir):g" \
		etc/lua.pc src/luaconf.h || die
}

multilib_src_compile() {
	tc-export CC
	myflags=
	# what to link to liblua
	liblibs="-lm"
	liblibs="${liblibs} $(dlopen_lib)"

	# what to link to the executables
	mylibs=
	if use readline; then
		mylibs="-lreadline"
	fi

	cd src
	emake CC="${CC}" CFLAGS="-DLUA_USE_LINUX ${CFLAGS}" \
			RPATH="${EPREFIX}/usr/$(get_libdir)/" \
			LUA_LIBS="${mylibs}" \
			LIB_LIBS="${liblibs}" \
			V=$(get_version_component_range 1-2) \
			gentoo_all

	mv lua_test ../test/lua.static
}

multilib_src_install() {
	emake INSTALL_TOP="${ED}/usr" INSTALL_LIB="${ED}/usr/$(get_libdir)" \
			V=${SLOT} gentoo_install

	insinto /usr/$(get_libdir)/pkgconfig
	newins etc/lua.pc lua${SLOT}.pc
}

multilib_src_install_all() {
	dodoc HISTORY README
	dohtml doc/*.html doc/*.png doc/*.css doc/*.gif

	doicon etc/lua.ico

	newman doc/lua.1 lua${SLOT}.1
	newman doc/luac.1 luac${SLOT}.1
}

multilib_src_test() {
	local positive="bisect cf echo env factorial fib fibfor hello printf sieve
	sort trace-calls trace-globals"
	local negative="readonly"
	local test

	cd "${BUILD_DIR}" || die
	for test in ${positive}; do
		test/lua.static test/${test}.lua || die "test $test failed"
	done

	for test in ${negative}; do
		test/lua.static test/${test}.lua && die "test $test failed"
	done
}
