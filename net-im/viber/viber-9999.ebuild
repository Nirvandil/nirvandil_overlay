# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm desktop

DESCRIPTION="Instant anv voice messenger"
HOMEPAGE="https://viber.com"
SRC_URI="https://download.cdn.viber.com/desktop/Linux/viber.rpm"

LICENSE="EULA"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/openssl:0/3"
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT="strip"
S=${WORKDIR}

src_unpack(){
	rpm_unpack viber.rpm
}
src_install(){
	dodir "opt/${PN}"
	doins -r opt
	dosym /opt/${PN}/Viber /usr/bin/Viber
	doicon "${S}/usr/share/pixmaps/viber.png"
	fperms 0755 /opt/${PN}/Viber
	fperms 0755 /opt/${PN}/QtWebEngineProcess
	make_desktop_entry Viber Viber viber Network
}
