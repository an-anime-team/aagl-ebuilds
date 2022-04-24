# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Ayatana Application Indicators Shared Library"
HOMEPAGE="https://github.com/AyatanaIndicators/libayatana-appindicator"
SRC_URI="https://gitlab.com/an-anime-team/aagl-ebuilds/-/archive/libayatana/aagl-ebuilds-libayatana.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
src_unpack(){
	unpack "aagl-ebuilds-libayatana.tar.gz"
}
src_prepare(){
	cd "aagl-ebuilds-libayatana"
	eapply_user
}
S="${WORKDIR}/aggl-ebuilds-libayatana"
src_install(){
	dodir /usr/lib64/
	cp -R "${S}/libayatana-indicator3.so.7.0.0" "${D}/usr/lib64" || die "Failed to Copy"
	cp -R "${S}/libayatana-indicator3.so.7" "${D}/usr/lib64/" || die "Failed to Copy"
	cp -R "${S}/libayatana-ido3-0.4.so.0.0.0" "${D}/usr/lib64" || die "Failed to Copy"
	cp -R "${S}/libayatana-ido3-0.4.so.0" "${D}/usr/lib64" || die "Failed to Copy"
	cp -R "${S}/libayatana-appindicator3.so.1.0.0" "${D}/usr/lib64" || die "Failed to Copy"
	cp -R "${S}/libayatana-appindicator3.so.1" "${D}/usr/lib64" || die "Failed to Copy"
}
