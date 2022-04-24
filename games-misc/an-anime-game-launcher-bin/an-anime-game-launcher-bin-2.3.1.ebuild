
# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Open Source An Anime Game launcher for Linux with automatic anti-cheat patching and telemetry disabling"
HOMEPAGE="https://gitlab.com/KRypt0n_/an-anime-game-launcher"
SRC_URI="https://gitlab.com/an-anime-team/aagl-ebuilds/-/archive/2.3.1/aagl-ebuilds-2.3.1.tar.gz"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
dev-libs/libayatana-appindicator
net-libs/webkit-gtk
dev-util/xdelta
app-arch/tar
dev-vcs/git
app-arch/unzip
net-misc/curl
app-arch/cabextract
x11-libs/libnotify
sys-auth/polkit
dev-libs/libdbusmenu
app-emulation/dxvk-bin
app-emulation/winetricks
virtual/wine
"
RDEPEND="${DEPEND}"
BDEPEND="
app-admin/chrpath"

src_unpack(){
	unpack "aagl-ebuilds-2.3.1.tar.gz" || die "Extraction Failed"
}
src_prepare(){
	cd "aagl-ebuilds-2.3.1"
	chmod +x "${S}/An_Anime_Game_Launcher.AppImage"
    "${S}/An_Anime_Game_Launcher.AppImage" --appimage-extract || die "Extraction Failed"
	chrpath -d "${S}/squashfs-root/public/discord-rpc/discord-rpc"
	dodir /usr/lib/
	eapply_user

}
S="${WORKDIR}/aagl-ebuilds-2.3.1"
src_install(){
	dodir /usr/lib/${PN}
	#mkdir "${D}/usr/lib/${PN}" || die "Creating Directory failed"
	dodir /usr/lib/
	cp -dr --no-preserve=ownership "${S}/squashfs-root/resources.neu" "${D}/usr/lib/${PN}/" || die "copy failed"
    cp -dr --no-preserve=ownership "${S}/squashfs-root/an-anime-game-launcher" "${D}/usr/lib/${PN}/" || die "copy failed"
	cp -dr --no-preserve=ownership "${S}/squashfs-root/public" "${D}/usr/lib/${PN}/" || die "copy failed"
	dodir /etc/polkit-1/rules.d/
	cp -dr --no-preserve=ownership "${S}/60-ananimegame.rules" "${D}/etc/polkit-1/rules.d/" || die "inserting Rules failed"
	dodir /usr/share/pixmaps/
	cp -dr --no-preserve=ownership "${S}/icon.png" "${D}/usr/share/pixmaps/${PN}.png" || die "copy failed"
	dodir /usr/bin/
	cp -dr --no-preserve=ownership "${S}/launcher.sh" "${D}/usr/bin/${PN}" || die "copy failed"
	chmod +x "${D}/usr/bin/${PN}"
	dodir /usr/share/applications/
	cp -dr --no-preserve=ownership "${S}/an-anime-game-launcher-bin.desktop" "${D}/usr/share/applications" || die "copy failed"
}
