# Copyright 2022 Pascal Jager
# Distributed under the terms of the GNU General Public License v3

# Auto-Generated by cargo-ebuild 0.5.2

EAPI=8

# To update the ebuild to a new release of an-anime-game-launcher-gtk:
# 1. Rename this ebuild to the new version
# 2. Go to https://github.com/an-anime-team/an-anime-game-launcher-gtk, open the files of the commit of the version you want to
# build this ebuild for.
# 3. Note the commit number of anime-game-core (the code after anime-game-core @ xxxxxxx), components and blueprint compiler
# 4. Put the commit numbers into the variables below:
anime_game_core_commit=73d3644761bef06cfc16e4e4bc4f9b9af3c50139
components_commit=ff194493e4614bc8c12cffed840a430651e17060
blueprint_compiler_commit=bc15ac9efbb762e9e960badb5bf35655e5d8603b

CRATES="
	adler-1.0.2
	aes-0.7.5
	aho-corasick-0.7.18
	anyhow-1.0.58
	ashpd-0.3.2
	async-broadcast-0.4.1
	async-channel-1.7.1
	async-executor-1.4.1
	async-io-1.9.0
	async-lock-2.5.0
	async-recursion-0.3.2
	async-task-4.3.0
	async-trait-0.1.57
	async_once-0.2.6
	autocfg-1.1.0
	base64-0.13.0
	base64ct-1.0.1
	bitflags-1.3.2
	block-0.1.6
	block-buffer-0.10.2
	bumpalo-3.10.0
	byteorder-1.4.3
	bzip2-0.4.3
	bzip2-sys-0.1.11+1.0.8
	cache-padded-1.2.0
	cached-0.40.0
	cached_proc_macro-0.15.0
	cached_proc_macro_types-0.1.0
	cairo-rs-0.16.1
	cairo-sys-rs-0.16.0
	cc-1.0.73
	cfg-expr-0.10.3
	cfg-if-1.0.0
	cipher-0.3.0
	concurrent-queue-1.2.4
	constant_time_eq-0.1.5
	core-foundation-sys-0.8.3
	cpufeatures-0.2.2
	crc32fast-1.3.2
	crossbeam-channel-0.5.6
	crossbeam-deque-0.8.2
	crossbeam-epoch-0.9.10
	crossbeam-utils-0.8.10
	crypto-common-0.1.3
	cty-0.2.2
	curl-0.4.43
	curl-sys-0.4.55+curl-7.83.1
	darling-0.13.4
	darling_core-0.13.4
	darling_macro-0.13.4
	derivative-2.2.0
	digest-0.10.3
	dirs-4.0.0
	dirs-sys-0.3.7
	dispatch-0.2.0
	either-1.7.0
	enumflags2-0.7.5
	enumflags2_derive-0.7.4
	event-listener-2.5.3
	fastrand-1.8.0
	field-offset-0.3.4
	filetime-0.2.16
	flate2-1.0.24
	fnv-1.0.7
	fs_extra-1.2.0
	futures-0.3.24
	futures-channel-0.3.24
	futures-core-0.3.24
	futures-executor-0.3.24
	futures-io-0.3.24
	futures-lite-1.12.0
	futures-macro-0.3.24
	futures-sink-0.3.24
	futures-task-0.3.24
	futures-util-0.3.24
	gdk-pixbuf-0.16.0
	gdk-pixbuf-sys-0.16.0
	gdk4-0.5.0
	gdk4-sys-0.5.0
	generic-array-0.14.5
	getrandom-0.2.7
	gio-0.16.2
	gio-sys-0.16.0
	glib-0.16.2
	glib-build-tools-0.16.0
	glib-macros-0.16.0
	glib-sys-0.16.0
	gobject-sys-0.16.0
	graphene-rs-0.16.0
	graphene-sys-0.16.0
	gsk4-0.5.0
	gsk4-sys-0.5.0
	gtk4-0.5.1
	gtk4-macros-0.5.0
	gtk4-sys-0.5.0
	hashbrown-0.12.3
	heck-0.4.0
	hermit-abi-0.1.19
	hex-0.4.3
	hmac-0.12.1
	ident_case-1.0.1
	instant-0.1.12
	itoa-1.0.2
	jobserver-0.1.24
	js-sys-0.3.58
	kinda-virtual-fs-0.1.1
	lazy_static-1.4.0
	libadwaita-0.2.0
	libadwaita-sys-0.2.0
	libc-0.2.126
	libz-sys-1.1.8
	lock_api-0.4.8
	log-0.4.17
	lzma-sys-0.1.19
	malloc_buf-0.0.6
	md5-0.7.0
	memchr-2.5.0
	memoffset-0.6.5
	miniz_oxide-0.5.3
	nix-0.23.1
	ntapi-0.3.7
	num_cpus-1.13.1
	num_enum-0.5.7
	num_enum_derive-0.5.7
	num_threads-0.1.6
	objc-0.2.7
	objc-foundation-0.1.1
	objc_id-0.1.1
	once_cell-1.14.0
	opaque-debug-0.3.0
	openssl-probe-0.1.5
	openssl-sys-0.9.74
	ordered-stream-0.0.1
	pango-0.16.0
	pango-sys-0.16.0
	parking-2.0.0
	parking_lot-0.12.1
	parking_lot_core-0.9.3
	password-hash-0.3.2
	pbkdf2-0.10.1
	pest-2.1.3
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.25
	polling-2.3.0
	pollster-0.2.5
	ppv-lite86-0.2.16
	proc-macro-crate-1.1.3
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.40
	quote-1.0.20
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.3
	raw-window-handle-0.5.0
	rayon-1.5.3
	rayon-core-1.9.3
	redox_syscall-0.2.13
	redox_users-0.4.3
	regex-1.6.0
	regex-syntax-0.6.27
	remove_dir_all-0.5.3
	rfd-0.10.0
	ring-0.16.20
	rustc_version-0.3.3
	rustls-0.20.6
	rustls-ffi-0.8.2
	rustls-pemfile-0.2.1
	ryu-1.0.10
	schannel-0.1.20
	scopeguard-1.1.0
	sct-0.7.0
	semver-0.11.0
	semver-parser-0.10.2
	serde-1.0.137
	serde_derive-1.0.137
	serde_json-1.0.81
	serde_repr-0.1.9
	sha1-0.6.1
	sha1-0.10.1
	sha1_smol-1.0.0
	sha2-0.10.2
	slab-0.4.6
	smallvec-1.8.1
	socket2-0.4.4
	spin-0.5.2
	static_assertions-1.1.0
	strsim-0.10.0
	subtle-2.4.1
	syn-1.0.98
	sysinfo-0.26.1
	system-deps-6.0.2
	tar-0.4.38
	tempfile-3.3.0
	thiserror-1.0.31
	thiserror-impl-1.0.31
	time-0.3.11
	time-macros-0.2.4
	tokio-1.20.1
	tokio-macros-1.8.0
	toml-0.5.9
	tracing-0.1.36
	tracing-attributes-0.1.22
	tracing-core-0.1.29
	typenum-1.15.0
	ucd-trie-0.1.3
	uds_windows-1.0.2
	unicode-ident-1.0.1
	untrusted-0.7.1
	urlencoding-2.1.2
	vcpkg-0.2.15
	version-compare-0.1.0
	version_check-0.9.4
	wait_not_await-0.2.1
	waker-fn-1.1.0
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.81
	wasm-bindgen-backend-0.2.81
	wasm-bindgen-futures-0.4.31
	wasm-bindgen-macro-0.2.81
	wasm-bindgen-macro-support-0.2.81
	wasm-bindgen-shared-0.2.81
	web-sys-0.3.58
	webpki-0.22.0
	wepoll-ffi-0.1.2
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
	wincompatlib-0.1.2
	windows-0.37.0
	windows-sys-0.36.1
	windows_aarch64_msvc-0.36.1
	windows_aarch64_msvc-0.37.0
	windows_i686_gnu-0.36.1
	windows_i686_gnu-0.37.0
	windows_i686_msvc-0.36.1
	windows_i686_msvc-0.37.0
	windows_x86_64_gnu-0.36.1
	windows_x86_64_gnu-0.37.0
	windows_x86_64_msvc-0.36.1
	windows_x86_64_msvc-0.37.0
	xattr-0.2.3
	xz-0.1.0
	xz2-0.1.7
	zbus-2.3.2
	zbus_macros-2.3.2
	zbus_names-2.2.0
	zip-0.6.2
	zstd-0.10.2+zstd.1.5.2
	zstd-safe-4.1.6+zstd.1.5.2
	zstd-sys-1.6.3+zstd.1.5.2
	zvariant-3.6.0
	zvariant_derive-3.6.0
"

DEPEND="
	gui-libs/libadwaita
	app-arch/tar
	app-arch/unzip
	dev-util/xdelta:3[lzma]
	app-arch/cabextract
	dev-vcs/git
	net-misc/curl
	>=gui-libs/gtk-4
	net-misc/iputils
	sys-libs/glibc
	sys-auth/polkit
"

RDEPEND="${DEPEND}"

BDEPEND="virtual/rust"

inherit cargo xdg-utils desktop

DESCRIPTION="Anime Game launcher with automatic anti-cheat patching, Rust/ Gtk version"
HOMEPAGE="https://github.com/an-anime-team/an-anime-game-launcher-gtk"
SRC_URI="
	https://github.com/an-anime-team/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/an-anime-team/anime-game-core/archive/${anime_game_core_commit}.tar.gz
	https://github.com/an-anime-team/components/archive/${components_commit}.tar.gz
	https://gitlab.gnome.org/jwestman/blueprint-compiler/-/archive/${blueprint_compiler_commit}/blueprint-compiler-${blueprint_compiler_commit}.tar.gz
	$(cargo_crate_uris)
"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD Boost-1.0 CC0-1.0 GPL-3 ISC MIT Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

src_prepare() {
	default
	# patch the .desktop file to work in non-AppImage environment
	sed -i 's/Icon=icon/Icon=anime-game-launcher/' assets/anime-game-launcher.desktop
	sed -i 's/Exec=AppRun/Exec=anime-game-launcher/' assets/anime-game-launcher.desktop
}

src_unpack() {
	cargo_src_unpack
	rm -rf "${S}"/anime-game-core
	ln -s "${WORKDIR}/anime-game-core-${anime_game_core_commit}" "${S}"/anime-game-core
	rm -rf "${S}"/components
	ln -s "${WORKDIR}/components-${components_commit}" "${S}"/components
	rm -rf "${S}"/blueprint-compiler
	ln -s "${WORKDIR}/blueprint-compiler-${blueprint_compiler_commit}" "${S}"/blueprint-compiler
	# git-r3_fetch $EGIT_REPO_URI_CORE "${anime_game_core_commit}" || die
	# git-r3_fetch $EGIT_REPO_URI_COMP "${components_commit}" || die
	# git-r3_fetch $EGIT_REPO_URI_BC "${blueprint_compiler_commit}"
	# git-r3_checkout $EGIT_REPO_URI_CORE "${WORKDIR}/${P}/anime-game-core" || die
	# git-r3_checkout $EGIT_REPO_URI_COMP "${WORKDIR}/${P}/components" || die
	# git-r3_checkout $EGIT_REPO_URI_BC "${WORKDIR}/${P}/blueprint-compiler" || die
}

src_install() {
	cargo_src_install
	domenu assets/anime-game-launcher.desktop
	newicon assets/images/icon.png anime-game-launcher.png
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
