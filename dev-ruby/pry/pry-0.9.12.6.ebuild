# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/pry/pry-0.9.12.6.ebuild,v 1.2 2014/08/05 16:00:45 mrueg Exp $

EAPI=5

USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.markdown"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Pry is a powerful alternative to the standard IRB shell for Ruby"
HOMEPAGE="https://github.com/pry/pry/wiki"
IUSE=""
SLOT="ruby19"

LICENSE="MIT"
KEYWORDS="~amd64 ~ppc64 ~x86"

ruby_add_rdepend "
	>=dev-ruby/coderay-1.0.5
	>=dev-ruby/slop-3.4.1:3
	>=dev-ruby/method_source-0.8"

ruby_add_bdepend "
	test? (
		>=dev-ruby/bacon-1.2
		>=dev-ruby/open4-1.3
		>=dev-ruby/rake-0.9
		>=dev-ruby/mocha-0.13.1
	)"

all_ruby_prepare() {
	# Avoid unneeded dependency on git.
	# Loosen coderay dependency.
	sed -e '/git ls-files/d' \
		-e '/coderay/s/~>/>=/' \
		-i ${RUBY_FAKEGEM_GEMSPEC} || die
}

each_ruby_test() {
	${RUBY} -S bacon -Ispec -q spec/*_spec.rb spec/*/*_spec.rb || die
}
