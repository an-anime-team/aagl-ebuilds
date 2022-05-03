# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Ayatana Application Indicators Shared Library"
HOMEPAGE="https://github.com/AyatanaIndicators/libayatana-appindicator"
SRC_URI="https://gitlab.com/an-anime-team/aagl-ebuilds/-/archive/libayatana/aagl-ebuilds-libayatana.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	sys-libs/glibc \
	>=dev-libs/glib-2.58 \
	>=x11-libs/gtk+-3.24 \
	dev-libs/libdbusmenu[gtk3] \
	!dev-libs/libayatana-appindicator \
	"
S="${WORKDIR}/aagl-ebuilds-libayatana"
src_install(){
	insinto /usr/$(get_libdir)
	doins libayatana-indicator3.so.7.0.0
	dosym libayatana-indicator3.so.7.0.0 /usr/$(get_libdir)/libayatana-indicator3.so.7
	dosym libayatana-indicator3.so.7 /usr/$(get_libdir)/libayatana-indicator3.so
	doins libayatana-ido3-0.4.so.0.0.0
	dosym libayatana-ido3-0.4.so.0.0.0 /usr/$(get_libdir)/libayatana-ido3-0.4.so.0
	dosym libayatana-ido3-0.4.so.0 /usr/$(get_libdir)/libayatana-ido3-0.4.so
	doins libayatana-appindicator3.so.1.0.0
	dosym libayatana-appindicator3.so.1.0.0 /usr/$(get_libdir)/libayatana-appindicator3.so.1
	dosym libayatana-appindicator3.so.1 /usr/$(get_libdir)/libayatana-appindicator3.so
}
