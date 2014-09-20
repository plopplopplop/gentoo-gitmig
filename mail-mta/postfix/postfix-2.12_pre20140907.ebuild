# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5
inherit eutils flag-o-matic multilib pam ssl-cert systemd toolchain-funcs user versionator

MY_PV="${PV/_pre/-}"
MY_SRC="${PN}-${MY_PV}"
MY_URI="ftp://ftp.porcupine.org/mirrors/postfix-release/experimental"
VDA_PV="2.10.0"
VDA_P="${PN}-vda-v13-${VDA_PV}"
RC_VER="2.7"

DESCRIPTION="A fast and secure drop-in replacement for sendmail"
HOMEPAGE="http://www.postfix.org/"
SRC_URI="${MY_URI}/${MY_SRC}.tar.gz
	vda? ( http://vda.sourceforge.net/VDA/${VDA_P}.patch ) "

LICENSE="IBM"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ppc ~ppc64 ~x86"
IUSE="+berkdb cdb doc dovecot-sasl eai hardened ldap ldap-bind lmdb memcached mbox mysql nis pam postgres sasl selinux sqlite ssl vda"

DEPEND=">=dev-libs/libpcre-3.4
	dev-lang/perl
	berkdb? ( >=sys-libs/db-3.2 )
	cdb? ( || ( >=dev-db/tinycdb-0.76 >=dev-db/cdb-0.75-r1 ) )
	eai? ( dev-libs/icu )
	ldap? ( net-nds/openldap )
	ldap-bind? ( net-nds/openldap[sasl] )
	lmdb? ( >=dev-db/lmdb-0.9.11 )
	mysql? ( virtual/mysql )
	pam? ( virtual/pam )
	postgres? ( dev-db/postgresql-base )
	sasl? (  >=dev-libs/cyrus-sasl-2 )
	selinux? ( sec-policy/selinux-postfix )
	sqlite? ( dev-db/sqlite:3 )
	ssl? ( >=dev-libs/openssl-0.9.6g )"

RDEPEND="${DEPEND}
	dovecot-sasl? ( net-mail/dovecot )
	memcached? ( net-misc/memcached )
	net-mail/mailbase
	!mail-mta/courier
	!mail-mta/esmtp
	!mail-mta/exim
	!mail-mta/mini-qmail
	!mail-mta/msmtp[mta]
	!mail-mta/netqmail
	!mail-mta/nullmailer
	!mail-mta/qmail-ldap
	!mail-mta/sendmail
	!mail-mta/opensmtpd
	!<mail-mta/ssmtp-2.64-r2
	!>=mail-mta/ssmtp-2.64-r2[mta]
	!net-mail/fastforward"

# No vda support for postfix-2.12
REQUIRED_USE="ldap-bind? ( ldap sasl )
		!vda"

S="${WORKDIR}/${MY_SRC}"

pkg_setup() {
	# Add postfix, postdrop user/group (bug #77565)
	enewgroup postfix 207
	enewgroup postdrop 208
	enewuser postfix 207 -1 /var/spool/postfix postfix,mail
}

src_prepare() {
	if use vda; then
		epatch "${DISTDIR}"/${VDA_P}.patch
	fi

	sed -i -e "/^#define ALIAS_DB_MAP/s|:/etc/aliases|:/etc/mail/aliases|" \
		src/util/sys_defs.h || die "sed failed"

	# change default paths to better comply with portage standard paths
	sed -i -e "s:/usr/local/:/usr/:g" conf/master.cf || die "sed failed"

	epatch_user
}

src_configure() {
	for name in CDB LDAP LMDB MYSQL PCRE PGSQL SDBM SQLITE
	do
		local AUXLIBS_${name}=""
	done

	# Make sure LDFLAGS get passed down to the executables.
	local mycc="-DHAS_PCRE" mylibs="${LDFLAGS} -ldl"
	AUXLIBS_PCRE="$(pcre-config --libs)"

	use pam && mylibs="${mylibs} -lpam"

	if use ldap; then
		mycc="${mycc} -DHAS_LDAP"
		AUXLIBS_LDAP="-lldap -llber"
	fi

	if use mysql; then
		mycc="${mycc} -DHAS_MYSQL $(mysql_config --include)"
		AUXLIBS_MYSQL="$(mysql_config --libs)"
	fi

	if use postgres; then
		mycc="${mycc} -DHAS_PGSQL -I$(pg_config --includedir)"
		AUXLIBS_PGSQL="-L$(pg_config --libdir) -lpq"
	fi

	if use sqlite; then
		mycc="${mycc} -DHAS_SQLITE"
		AUXLIBS_SQLITE="-lsqlite3 -lpthread"
	fi

	if use ssl; then
		mycc="${mycc} -DUSE_TLS"
		mylibs="${mylibs} -lssl -lcrypto"
	fi

	if use lmdb; then
		mycc="${mycc} -DHAS_LMDB"
		AUXLIBS_LMDB="-llmdb -lpthread"
	fi

	if ! use eai; then
		mycc="${mycc} -DNO_EAI"
	fi

	# broken. and "in other words, not supported" by upstream.
	# Use inet_protocols setting in main.cf
	#if ! use ipv6; then
	#	mycc="${mycc} -DNO_IPV6"
	#fi

	if use sasl; then
		if use dovecot-sasl; then
			# Set dovecot as default.
			mycc="${mycc} -DDEF_SASL_SERVER=\\\"dovecot\\\""
		fi
		if use ldap-bind; then
			mycc="${mycc} -DUSE_LDAP_SASL"
		fi
		mycc="${mycc} -DUSE_SASL_AUTH -DUSE_CYRUS_SASL -I/usr/include/sasl"
		mylibs="${mylibs} -lsasl2"
	elif use dovecot-sasl; then
		mycc="${mycc} -DUSE_SASL_AUTH -DDEF_SERVER_SASL_TYPE=\\\"dovecot\\\""
	fi

	if ! use nis; then
		mycc="${mycc} -DNO_NIS"
	fi

	if ! use berkdb; then
		mycc="${mycc} -DNO_DB"
		if use cdb; then
			# change default hash format from Berkeley DB to cdb
			mycc="${mycc} -DDEF_DB_TYPE=\\\"cdb\\\""
		fi
	fi

	if use cdb; then
		mycc="${mycc} -DHAS_CDB -I/usr/include/cdb"
		# Tinycdb is preferred.
		if has_version dev-db/tinycdb ; then
			einfo "Building with dev-db/tinycdb"
			AUXLIBS_CDB="-lcdb"
		else
			einfo "Building with dev-db/cdb"
			CDB_PATH="/usr/$(get_libdir)"
			for i in cdb.a alloc.a buffer.a unix.a byte.a ; do
				AUXLIBS_CDB="${AUXLIBS_CDB} ${CDB_PATH}/${i}"
			done
		fi
	fi

	# Robin H. Johnson <robbat2@gentoo.org> 17/Nov/2006
	# Fix because infra boxes hit 2Gb .db files that fail a 32-bit fstat signed check.
	mycc="${mycc} -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE"
	filter-lfs-flags

	# Workaround for bug #76512
	if use hardened; then
		[[ "$(gcc-version)" == "3.4" ]] && replace-flags -O? -Os
	fi

	# Remove annoying C++ comment style warnings - bug #378099
	append-flags -Wno-comment

	sed -i -e "/^RANLIB/s/ranlib/$(tc-getRANLIB)/g" "${S}"/makedefs
	sed -i -e "/^AR/s/ar/$(tc-getAR)/g" "${S}"/makedefs

	emake makefiles shared=yes dynamicmaps=no \
		shlib_directory="/usr/$(get_libdir)/postfix/MAIL_VERSION" \
		DEBUG="" CC="$(tc-getCC)" OPT="${CFLAGS}" CCARGS="${mycc}" AUXLIBS="${mylibs}" \
		AUXLIBS_CDB="${AUXLIBS_CDB}" AUXLIBS_LDAP="${AUXLIBS_LDAP}" \
		AUXLIBS_LMDB="${AUXLIBS_LMDB}" AUXLIBS_MYSQL="${AUXLIBS_MYSQL}" \
		AUXLIBS_PCRE="${AUXLIBS_PCRE}" AUXLIBS_PGSQL="${AUXLIBS_PGSQL}" \
		AUXLIBS_SQLITE="${AUXLIBS_SQLITE}"
}

src_install () {
	local myconf
	use doc && myconf="readme_directory=\"/usr/share/doc/${PF}/readme\" \
		html_directory=\"/usr/share/doc/${PF}/html\""

	LD_LIBRARY_PATH="${S}/lib" \
	/bin/sh postfix-install \
		-non-interactive \
		install_root="${D}" \
		config_directory="/etc/postfix" \
		manpage_directory="/usr/share/man" \
		command_directory="/usr/sbin" \
		mailq_path="/usr/bin/mailq" \
		newaliases_path="/usr/bin/newaliases" \
		sendmail_path="/usr/sbin/sendmail" \
		${myconf} \
		|| die "postfix-install failed"

	# Fix spool removal on upgrade
	rm -Rf "${D}"/var
	keepdir /var/spool/postfix

	# Install rmail for UUCP, closes bug #19127
	dobin auxiliary/rmail/rmail

	# Provide another link for legacy FSH
	dosym /usr/sbin/sendmail /usr/$(get_libdir)/sendmail

	# Install qshape tool and posttls-finger
	dobin auxiliary/qshape/qshape.pl
	doman man/man1/qshape.1
	dobin bin/posttls-finger
	doman man/man1/posttls-finger.1

	# Performance tuning tools and their manuals
	dosbin bin/smtp-{source,sink} bin/qmqp-{source,sink}
	doman man/man1/smtp-{source,sink}.1 man/man1/qmqp-{source,sink}.1

	# Set proper permissions on required files/directories
	dodir /var/lib/postfix
	keepdir /var/lib/postfix
	fowners -R postfix:postfix /var/lib/postfix
	fperms 0750 /var/lib/postfix
	fowners root:postdrop /usr/sbin/post{drop,queue}
	fperms 02711 /usr/sbin/post{drop,queue}

	keepdir /etc/postfix
	if use mbox; then
		mypostconf="mail_spool_directory=/var/spool/mail"
	else
		mypostconf="home_mailbox=.maildir/"
	fi
	LD_LIBRARY_PATH="${S}/lib" \
	"${D}"/usr/sbin/postconf -c "${D}"/etc/postfix \
		-e ${mypostconf} || die "postconf failed"

	insinto /etc/postfix
	newins "${FILESDIR}"/smtp.pass saslpass
	fperms 600 /etc/postfix/saslpass

	newinitd "${FILESDIR}"/postfix.rc6.${RC_VER} postfix
	# do not start mysql/postgres unnecessarily - bug #359913
	use mysql || sed -i -e "s/mysql //" "${D}/etc/init.d/postfix"
	use postgres || sed -i -e "s/postgresql //" "${D}/etc/init.d/postfix"

	dodoc *README COMPATIBILITY HISTORY PORTING RELEASE_NOTES*
	mv "${D}"/etc/postfix/{*.default,*.proto} "${D}"/usr/share/doc/${PF}/
	use doc && mv "${S}"/examples "${D}"/usr/share/doc/${PF}/

	pamd_mimic_system smtp auth account

	if use sasl; then
		insinto /etc/sasl2
		newins "${FILESDIR}"/smtp.sasl smtpd.conf
	fi

	# header files
	insinto /usr/include/postfix
	doins include/*.h

	# Remove unnecessary files
	rm -f "${D}"/etc/postfix/{*LICENSE,access,aliases,canonical,generic}
	rm -f "${D}"/etc/postfix/{header_checks,relocated,transport,virtual}

	systemd_dounit "${FILESDIR}/${PN}.service"
}

pkg_postinst() {
	# Do not install server.{key,pem) SSL certificates if they already exist
	if use ssl && [[ ! -f "${ROOT}"/etc/ssl/postfix/server.key \
		&& ! -f "${ROOT}"/etc/ssl/postfix/server.pem ]] ; then
		SSL_ORGANIZATION="${SSL_ORGANIZATION:-Postfix SMTP Server}"
		install_cert /etc/ssl/postfix/server
		chown postfix:mail "${ROOT}"/etc/ssl/postfix/server.{key,pem}
	fi

	if [[ ! -e /etc/mail/aliases.db ]] ; then
		ewarn
		ewarn "You must edit /etc/mail/aliases to suit your needs"
		ewarn "and then run /usr/bin/newaliases. Postfix will not"
		ewarn "work correctly without it."
		ewarn
	fi

	if [[ $(get_version_component_range 2 ${REPLACING_VERSIONS}) -lt 9 ]]; then
		elog "If you are using old style postfix instances by symlinking"
		elog "startup scripts in ${ROOT}etc/init.d, please consider"
		elog "upgrading your config for postmulti support. For more info:"
		elog "http://www.postfix.org/MULTI_INSTANCE_README.html"
		if ! use berkdb; then
			ewarn "\nPostfix is installed without BerkeleyDB support."
			ewarn "Please turn on berkdb USE flag if you need hash or"
			ewarn "btree table lookups.\n"
		fi
		ewarn "Postfix daemons now live under /usr/libexec/postfix"
		ewarn "Please adjust your main.cf accordingly by running"
		ewarn "etc-update/dispatch-conf or similar and accepting the new"
		ewarn "daemon_directory setting."
	fi
}
