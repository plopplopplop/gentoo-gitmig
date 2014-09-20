# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-tv/tvmovie2vdr/tvmovie2vdr-0.5.12.ebuild,v 1.5 2009/07/19 17:55:56 tove Exp $

inherit eutils

VDR_CONF_DIR="/etc/vdr"
VDR_VIDEO_DIR="/var/vdr/video"

CONF_DIR="/etc/vdr/tvmovie2vdr"
VAR_DIR="/var/vdr/tvmovie2vdr"
SHARE_DIR="/usr/share/${PN}"

DESCRIPTION="load the program guide from tvmovie and others to vdr"
HOMEPAGE="http://steckrue.be/tvm2vdr/"
SRC_URI="http://steckrue.be/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=media-video/vdr-1.2.0
	>=dev-perl/DateManip-5.42a-r1
	>=virtual/perl-IO-Compress-1.22
	>=dev-perl/Archive-Zip-1.14
	>=dev-perl/Text-Iconv-1.4
	>=dev-perl/libwww-perl-5.69-r2
	>=dev-perl/HTML-Parser-3.34-r1
	>=dev-perl/HTML-Scrubber-0.08
	>=dev-perl/HTML-TableContentParser-0.13
	>=dev-perl/XML-Simple-DTDReader-0.03
	>=media-gfx/imagemagick-6.2.2.3
	dev-perl/DateManip
	dev-perl/XML-Simple-DTDReader"

src_compile() {
	# change default downloadpath in config
	sed -i config.pl_dist \
	  -e "s:channelsfile = .*;:channelsfile = \"${VDR_CONF_DIR}/channels.conf\";:" \
	  -e "s:epgfile = .*;:epgfile = \"${VDR_VIDEO_DIR}/epg.data\";:" \
	  -e "s:downloadprefix = .*;:downloadprefix = \"${VAR_DIR}/downloadfiles/\";:" \
	  -e "s:updateprefix = .*;:updateprefix = \"${VAR_DIR}/downloadupdatefiles/\";:" \
	  -e "s:infosaturl=.*;:infosaturl=\"${VAR_DIR}/infosatepg\";:" \
	  -e 's:imagepath = .*;:imagepath = "/var/vdr/epgimages";:'

	# set correct pathes to conf and include files
	sed -i tvm2vdr.pl tvinfomerk2vdr.pl clearoldtimer.pl \
	  -e 's:push (@INC, "./");:push (@INC, "'${CONF_DIR}'");:' \
	  -e 's:push (@INC, "./inc");:push (@INC, "'${SHARE_DIR}/inc'");:' \
	  -e "s:contrib/:${SHARE_DIR}/contrib/:"
}

src_install() {
	# config files
	insinto "${CONF_DIR}"
	local c
	for c in *dist; do
		newins "${c}" "${c%_dist}"
	done

	# include files - helpers for different providers
	insinto "${SHARE_DIR}/inc"
	doins inc/*.pl

	exeinto "${SHARE_DIR}/contrib"
	doexe ./contrib/*.pl
	doexe clearoldtimer.pl getinfosat.sh tvm2vdr.sh

	# install main binaries
	dobin tvinfomerk2vdr.pl
	dobin tvm2vdr.pl

	# dirs to keep downloaded data in
	keepdir "${VAR_DIR}/downloadfiles"
	keepdir "${VAR_DIR}/downloadupdatefiles"
	keepdir "/var/vdr/epgimages"
	chown -R vdr:vdr "${D}/${VAR_DIR}" "${D}/var/vdr/epgimages"

	# install documentation
	dodoc HISTORY README tvm2vdr.sh
}

pkg_postinst() {
	# cleanup old cruft
	[ -L "${ROOT}/etc/vdr/tvmovie2vdr/files" ] \
		&& rm -f "${ROOT}/etc/vdr/tvmovie2vdr/files"

	[ -L "${ROOT}/var/vdr/tvmovie2vdr/tvmovie2vdr" ] \
		&& rm -f "${ROOT}/var/vdr/tvmovie2vdr/tvmovie2vdr"

	elog "You have to configure the following files:"
	elog "\t${CONF_DIR}/config.pl"
	elog "\t${CONF_DIR}/channels_wanted.pl"
	elog
	elog "It's a good idea to add the following to /etc/crontab:"
	elog "\t3  5  * * *	   vdr	   /usr/bin/tvinfomerk2vdr.pl"
	elog "\t7  5  * * *	   vdr	   /usr/bin/tvm2vdr.pl"
	elog
	elog "To delete old pictures you should run the following command with the tvmovie2vdr run:"
	elog "\tfind /var/vdr/epgimages/ -type f -mtime +10 -exec rm {} \;"
	elog "or see tvm2vdr.sh in /usr/share/tvmovie2vdr/contrib"
	elog
}
