
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
dev-libs/libayatana-appindicator-bin
net-libs/webkit-gtk
dev-util/xdelta[lzma]
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
	mv "${S}/icon.png" "${S}/${PN}.png"
	mv "${S}/launcher.sh" "${S}/${PN}"
	chmod +x "${S}/An_Anime_Game_Launcher.AppImage"
    "${S}/An_Anime_Game_Launcher.AppImage" --appimage-extract || die "Extraction Failed"
	chrpath -d "${S}/squashfs-root/public/discord-rpc/discord-rpc" || die "Patching Library Failed"
	eapply_user

}
S="${WORKDIR}/aagl-ebuilds-2.3.1"
src_install(){
	dodir "/usr/lib/${PN}"
	insinto "/usr/lib/${PN}"
	einfo "Inserting Launcher Files"
	doins -r "${S}/squashfs-root/resources.neu"
	einfo "Inserting Launcher Binary"
    doins -r "${S}/squashfs-root/an-anime-game-launcher"
	einfo "Setting Executable Permissions for Binary"
	chmod +x "${D}/usr/lib/${PN}/an-anime-game-launcher"
	einfo "Inserting More Launcher Files"
	doins -r "${S}/squashfs-root/public"
	einfo "Inserting Icons"
	insinto "/usr/share/pixmaps"
	doins "${S}/${PN}.png" || die "Insertion Failed"
	einfo "Inserting Start Script"
	insinto "/usr/bin"
	doins "${S}/${PN}" || die "Insertion Failed"
	einfo "Setting Executable Permissions for Launch Script"
	chmod +x "${D}/usr/bin/${PN}"
	einfo "Inserting Desktop Shortcut"
	insinto "/usr/share/applications/"
	doins "${S}/${PN}.desktop"
	einfo "Setting Read Permissions for Launcher Files"
	chmod -R 775 "${D}/usr/lib/${PN}/public"
}
