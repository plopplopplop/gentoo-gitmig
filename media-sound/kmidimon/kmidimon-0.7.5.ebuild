# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5
KDE_LINGUAS="cs es ja"
KDE_HANDBOOK="optional"
inherit kde4-base

DESCRIPTION="A MIDI monitor for ALSA sequencer"
HOMEPAGE="http://kmetronome.sourceforge.net/kmidimon/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="4"
KEYWORDS="amd64 x86"
IUSE="debug"

RDEPEND="
	media-libs/alsa-lib
	>=media-sound/drumstick-0.5
"
DEPEND="${RDEPEND}"

DOCS=( AUTHORS ChangeLog NEWS README TODO )

src_configure() {
	local mycmakeargs=(
		-DSTATIC_DRUMSTICK=OFF
	)

	kde4-base_src_configure
}
