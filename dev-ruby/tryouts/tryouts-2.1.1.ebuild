# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

USE_RUBY="ruby19"

RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="CHANGES.txt README.rdoc"

inherit ruby-fakegem eutils

DESCRIPTION="High-level testing library (DSL) for Ruby codes and command-line applications"
HOMEPAGE="http://solutious.com/"

LICENSE="MIT"
SLOT="2"
KEYWORDS="~amd64 ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sysinfo-0.7.3"

ruby_add_bdepend "test? ( dev-ruby/hexoid )"

each_ruby_test() {
	${RUBY} -Ilib bin/try || die "Tests failed"
}
