# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Internet radio"
HOMEPAGE="https://gitlab.com/goodvibes/goodvibes"
SRC_URI="https://gitlab.com/goodvibes/goodvibes/-/archive/v${PV}/goodvibes-v${PV}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

inherit meson gnome2-utils xdg
S="${WORKDIR}/${PN}-v${PV}"
DEPEND="
	dev-libs/glib
	net-libs/libsoup:2.4
	media-libs/gstreamer
	media-libs/gst-plugins-base
	x11-libs/gtk+:3
	dev-libs/keybinder
"
RDEPEND="
	${DEPEND}
	gnome-base/dconf
	media-libs/gst-plugins-bad
	media-libs/gst-plugins-ugly
	media-plugins/gst-plugins-meta[http]
	media-plugins/gst-plugins-hls
"
BDEPEND="
	dev-util/meson
	dev-vcs/git
"
pkg_postinst() {
	xdg_pkg_postinst
	xdg_desktop_database_update
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_schemas_update
	xdg_desktop_database_update
	xdg_pkg_postrm
}
