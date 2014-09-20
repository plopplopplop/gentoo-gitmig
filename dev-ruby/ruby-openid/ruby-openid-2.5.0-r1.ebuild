# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-openid/ruby-openid-2.5.0-r1.ebuild,v 1.1 2014/07/25 15:04:43 mrueg Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md NOTICE UPGRADE.md"

inherit ruby-fakegem

DESCRIPTION="A robust library for verifying and serving OpenID identities"
HOMEPAGE="http://ruby-openid.rubyforge.org/"
SRC_URI="https://github.com/openid/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~x86-macos"
IUSE="test"

all_ruby_prepare() {
	sed -i -e "/[Bb]undler/d" Rakefile || die
}

all_ruby_install() {
	all_fakegem_install

	insinto /usr/share/doc/${PF}
	doins -r examples
}
