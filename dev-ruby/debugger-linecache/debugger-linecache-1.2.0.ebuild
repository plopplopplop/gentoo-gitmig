# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/debugger-linecache/debugger-linecache-1.2.0.ebuild,v 1.2 2013/12/31 06:50:14 graaff Exp $

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 jruby"

RUBY_FAKEGEM_TASK_TEST="test"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="OLD_README OLD_CHANGELOG CHANGELOG.md README.md"

inherit ruby-fakegem

DESCRIPTION="A module to read and cache file information of a Ruby program"
HOMEPAGE="https://github.com/cldwalker/debugger-linecache"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

all_ruby_prepare() {
	sed -i -e "/# -/d" debugger-linecache.gemspec || die

	sed -i -e '/git ls-files/d' debugger-linecache.gemspec || die
}
