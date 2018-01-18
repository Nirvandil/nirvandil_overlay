# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit desktop

DESCRIPTION="Oficial BitConnect coin (BCC) wallet."
HOMEPAGE="https://bitconnect.co"
SRC_URI="https://github.com/bitconnectcoin/bitconnectcoin/raw/master/setup/bitconnect-linux-wallet/Bitconnect-Ubuntu16-64bit.tar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
S="${WORKDIR}"

DEPEND=">=dev-libs/boost-1.32 
>=dev-libs/openssl-1.0.2n
>=media-gfx/qrencode-3.4.4
dev-qt/qtgui"
RDEPEND="${DEPEND}"
src_install() {
	sed -i 's!/icons/bitconnect.png!/pixmaps/bitconnect.png!' Bitconnectcoin.desktop
	echo "Categories=Office;Finance;P2P;Network;Qt;" >> Bitconnectcoin.desktop
	dobin bitconnect-qt
	insinto /usr/share/pixmaps
	doicon bitconnect.png
	newmenu Bitconnectcoin.desktop BitConnect.desktop
}
