# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5
USE_RUBY="ruby19 ruby20"

RUBY_FAKEGEM_RECIPE_TEST="none"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README"

inherit multilib ruby-fakegem

DESCRIPTION="System Information Gatherer And Reporter"
HOMEPAGE="http://sigar.hyperic.com/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

ruby_add_bdepend "test? ( >=dev-ruby/test-unit-2.5.1-r1 )"

each_ruby_configure() {
	${RUBY} -Cbindings/ruby extconf.rb || die
}

each_ruby_compile() {
	emake -Cbindings/ruby V=1
	mkdir lib || die
	cp bindings/ruby/${PN}$(get_modname) lib/ || die
}

each_ruby_test() {
	ruby-ng_testrb-2 -Ilib bindings/ruby/test/*_test.rb
}
