#!/sbin/runscript
# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

depend() {
	use logger
}

PIDFILE=/var/run/razerd/razerd.pid

start() {
	ebegin "Starting razerd"
	start-stop-daemon --start \
		--pidfile ${PIDFILE} \
		--exec /usr/sbin/razerd \
		-- --background --pidfile ${PIDFILE}
	eend $?
}

stop() {
	ebegin "Stopping razerd"
	start-stop-daemon --stop --pidfile ${PIDFILE}
	eend $?
}

