# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Dark breeze theme for SDDM"
HOMEPAGE="https://gentooblog.cf"
SRC_URI="https://gentooblog.pp.ua/${P}.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="kde-plasma/plasma-workspace"
RDEPEND="${DEPEND}"
src_install() {
	dodir /usr/share/sddm/themes/breeze-dark
	cp -R "${S}/" "${D}/usr/share/sddm/themes/" || die "Install failed!"
}
