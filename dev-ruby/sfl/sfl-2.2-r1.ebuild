# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_RECIPE_DOC="none"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

inherit ruby-fakegem

DESCRIPTION="This library provides spawn() which is almost perfectly compatible with ruby 1.9's"
HOMEPAGE="https://github.com/ujihisa/spawn-for-legacy"

LICENSE="|| ( Ruby BSD-2 )"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

IUSE=""

all_ruby_prepare() {
	rm -f Gemfile* || die
	sed -i -e "s:/tmp:${TMPDIR}:" spec/sfl_spec.rb || die
}
