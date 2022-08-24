# copyright 1999-2022 gentoo authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg-utils optfeature

DESCRIPTION="Open Source An Anime Game launcher for Linux with automatic anti-cheat patching and telemetry disabling, binary package"
HOMEPAGE="https://gitlab.com/an-anime-team/an-anime-game-launcher"
SRC_URI="https://gitlab.com/an-anime-team/an-anime-game-launcher/uploads/54b2912675c50d5ab236bd745a259842/an-anime-game-launcher-2.3.8.AppImage -> ${P}.AppImage"

LICENSE="GPL-3 0BSD Apache-2.0 BSD-2-Clause BSD-3-Clause ISC MIT Unlicense"
SLOT="0"
KEYWORDS="~amd64"
PATCHES=( "${FILESDIR}/${PN}-launcher.patch" "${FILESDIR}/${P}-desktop.patch" )

DEPEND="
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

BDEPEND="app-admin/chrpath"

src_unpack() {
	mkdir ${WORKDIR}/${P} || die
	cp ${DISTDIR}/${P}.AppImage ${WORKDIR}/${P} || die
}

src_prepare(){
	chmod +x ${P}.AppImage
	./${P}.AppImage --appimage-extract || die "Extraction Failed"
	chrpath -d "squashfs-root/public/discord-rpc/discord-rpc" || die "Patching Library Failed"
	default
	mv "squashfs-root/public/icons/256x256.png" "${PN}.png" || die
	mv "squashfs-root/AppRun" "${PN}" || die
	mv "squashfs-root/an-anime-game-launcher.desktop" "${PN}.desktop" || die
}

src_install(){
	insinto "/usr/lib/${PN}"
	doins "squashfs-root/resources.neu"
	exeinto "/usr/lib/${PN}"
	doexe "squashfs-root/an-anime-game-launcher"
	doins -r "squashfs-root/public"
	insinto "/usr/share/pixmaps"
	doins "${PN}.png"
	exeinto "/usr/bin"
	doexe "${PN}"
	insinto "/usr/share/applications/"
	doins "${PN}.desktop"
}

pkg_postinst() {
	xdg_desktop_database_update
	optfeature "Appindicator support" dev-libs/libayatana-appindicator dev-libs/libayatana-appindicator-bin
}
pkg_postrm() {
	xdg_desktop_database_update
}
