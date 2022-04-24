# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Ayatana Application Indicators Shared Library"
HOMEPAGE="https://github.com/AyatanaIndicators/libayatana-appindicator"
SRC_URI="https://cdn.discordapp.com/attachments/967406033800679455/967495962283085864/libs.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
S="${WORKDIR}"
src_install(){
	dodir /usr/lib64/
	cp -R "${S}/libayatana-indicator3.so.7.0.0" "${D}/usr/lib64" || die "Failed to Copy"
	cp -R "${S}/libayatana-indicator3.so.7" "${D}/usr/lib64/" || die "Failed to Copy"
	cp -R "${S}/libayatana-ido3-0.4.so.0.0.0" "${D}/usr/lib64" || die "Failed to Copy"
	cp -R "${S}/libayatana-ido3-0.4.so.0" "${D}/usr/lib64" || die "Failed to Copy"
	cp -R "${S}/libayatana-appindicator3.so.1.0.0" "${D}/usr/lib64" || die "Failed to Copy"
	cp -R "${S}/libayatana-appindicator3.so.1" "${D}/usr/lib64" || die "Failed to Copy"
}
