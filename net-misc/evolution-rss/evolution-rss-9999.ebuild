# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit autotools git-r3
EGIT_REPO_URI="https://github.com/GNOME/evolution-rss"
DESCRIPTION="Plugin for reading RSS with Evolution"
HOMEPAGE="http://gnome.eu.org/index.php/Evolution_RSS_Reader_Plugin"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="mail-client/evolution"
RDEPEND="${DEPEND} gnome-extra/gtkhtml"
BDEPEND=""
src_prepare() {
   default
   eautoreconf
}
