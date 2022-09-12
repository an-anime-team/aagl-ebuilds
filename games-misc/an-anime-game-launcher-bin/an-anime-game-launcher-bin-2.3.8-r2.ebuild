# copyright 2022 ShinobuNarusaka, Pascal Jager
# Distributed under the terms of the GNU General Public License v3

EAPI=7

inherit xdg-utils optfeature

DESCRIPTION="Open Source An Anime Game launcher for Linux with automatic anti-cheat patching and telemetry disabling, binary package"
HOMEPAGE="https://github.com/an-anime-team/an-anime-game-launcher"
SRC_URI="https://github.com/an-anime-team/an-anime-game-launcher/releases/download/2.3.8/an-anime-game-launcher-2.3.8.AppImage -> ${P}.AppImage"

LICENSE="GPL-3 0BSD Apache-2.0 BSD-2-Clause BSD-3-Clause ISC MIT Unlicense"
SLOT="0"
KEYWORDS="~amd64 x86"
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
	"

RDEPEND="${DEPEND}"


src_unpack() {
	mkdir ${WORKDIR}/${P} || die
	cp ${DISTDIR}/${P}.AppImage ${WORKDIR}/${P} || die
}

src_prepare(){
	chmod +x ${P}.AppImage
	./${P}.AppImage --appimage-extract || die "Extraction Failed"
	default

	mv "squashfs-root/public/icons/256x256.png" "${PN}.png" || die
	mv "squashfs-root/AppRun" "${PN}" || die
	mv "squashfs-root/an-anime-game-launcher.desktop" "${PN}.desktop" || die
}

src_install(){
	into "/usr/lib/${PN}/public/" # set path for library
    dolib.so "squashfs-root/public/discord-rpc/libdiscord-rpc.so" # install lib
	insinto "/usr/lib/${PN}"
	doins "squashfs-root/resources.neu"
	exeinto "/usr/lib/${PN}"
	doexe "squashfs-root/an-anime-game-launcher"

	insinto "/usr/lib/${PN}/public" # specify path for public folders

	#copy all files/folders from squashfs-root/public
	doins -r "squashfs-root/public/dxvks.yaml"
	doins -r "squashfs-root/public/hdiffpatch"
	doins -r "squashfs-root/public/icons"
	doins -r "squashfs-root/public/images"
	doins -r "squashfs-root/public/locales"
	doins -r "squashfs-root/public/neutralino.js"
	doins -r "squashfs-root/public/runners.yaml"
	doins -r "squashfs-root/public/shaders"

	#create pix
	insinto "/usr/share/pixmaps"
	doins "${PN}.png"
	#create bin
	exeinto "/usr/bin"
	doexe "${PN}"
	#create desktop entry
	insinto "/usr/share/applications/"
	doins "${PN}.desktop"

	cd ${FILESDIR}
	insinto "/usr/lib/${PN}/public/discord-rpc/" # set path for discord-rpc binary
	doins "discord-rpc"  # install discord-rpc to path

	fperms 755 "/usr/lib/${PN}/public/discord-rpc/discord-rpc" # set permissions for discord-rpc
}

pkg_postinst() {
	xdg_desktop_database_update
	optfeature "Appindicator support" dev-libs/libayatana-appindicator dev-libs/libayatana-appindicator-bin
}
pkg_postrm() {
	xdg_desktop_database_update
}
