# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

#!/bin/sh

java -classpath $(java-config -p commons-logging,commons-httpclient-3,phex,jgoodies-looks-2.0,jgoodies-forms) phex.Main
