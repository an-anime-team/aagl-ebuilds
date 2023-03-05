# Copyright 2023 Pascal Jager
# Distributed under the terms of the GNU General Public License v3

# Autogenerated by pycargoebuild 0.6.2

EAPI=8

# To update the ebuild to a new release of an-anime-game-launcher:
# 1. Rename this ebuild to the new version
# 2. Go to https://github.com/an-anime-team/an-anime-game-launcher, open
# 	the files of the commit of the version you want to build this ebuild for.
# 	(From releases page)
# 3. Note the commit hash of anime-launcher-sdk
# 	(the code after anime-launcher-sdk @ xxxxxxx)
# 4. Click on the folder anime-launcher-sdk, this will take you to the
# 	anime-launcher-sdk repository.
# 5. Note the commit hash of anime-game-core and components
# 6. Put the commit hashs into the variables below:
anime_launcher_sdk_commit=ca8d649
anime_game_core_commit=c9c48de
components_commit=2833379

CRATES="
	adler-1.0.2
	aes-0.7.5
	aho-corasick-0.7.20
	anyhow-1.0.68
	arc-swap-1.5.1
	ashpd-0.3.2
	async-broadcast-0.4.1
	async-channel-1.8.0
	async-executor-1.5.0
	async-io-1.12.0
	async-lock-2.6.0
	async-recursion-0.3.2
	async-task-4.3.0
	async-trait-0.1.64
	async_once-0.2.6
	autocfg-1.1.0
	base64-0.13.1
	base64ct-1.5.3
	bitflags-1.3.2
	block-0.1.6
	block-buffer-0.10.3
	bstr-0.2.17
	bumpalo-3.11.1
	byteorder-1.4.3
	bzip2-0.4.3
	bzip2-sys-0.1.11+1.0.8
	cached-0.42.0
	cached_proc_macro-0.16.0
	cached_proc_macro_types-0.1.0
	cairo-rs-0.16.7
	cairo-sys-rs-0.16.3
	cc-1.0.78
	cfg-expr-0.11.0
	cfg-if-1.0.0
	cipher-0.3.0
	concurrent-queue-2.1.0
	constant_time_eq-0.1.5
	core-foundation-sys-0.8.3
	cpufeatures-0.2.5
	crc32fast-1.3.2
	crossbeam-channel-0.5.6
	crossbeam-deque-0.8.2
	crossbeam-epoch-0.9.13
	crossbeam-utils-0.8.14
	crypto-common-0.1.6
	cty-0.2.2
	curl-0.4.44
	curl-sys-0.4.59+curl-7.86.0
	darling-0.14.2
	darling_core-0.14.2
	darling_macro-0.14.2
	derivative-2.2.0
	derive_builder-0.12.0
	derive_builder_core-0.12.0
	derive_builder_macro-0.12.0
	digest-0.10.6
	dirs-4.0.0
	dirs-sys-0.3.7
	discord-rich-presence-0.2.3
	dispatch-0.2.0
	displaydoc-0.2.3
	doc-comment-0.3.3
	either-1.8.0
	enum-ordinalize-3.1.12
	enumflags2-0.7.5
	enumflags2_derive-0.7.4
	event-listener-2.5.3
	fastrand-1.9.0
	field-offset-0.3.4
	filetime-0.2.19
	flate2-1.0.25
	fluent-0.16.0
	fluent-bundle-0.15.2
	fluent-langneg-0.13.0
	fluent-syntax-0.11.0
	fluent-template-macros-0.8.0
	fluent-templates-0.8.0
	flume-0.10.14
	fnv-1.0.7
	fragile-2.0.0
	fs_extra-1.2.0
	futures-0.3.26
	futures-channel-0.3.26
	futures-core-0.3.26
	futures-executor-0.3.26
	futures-io-0.3.26
	futures-lite-1.12.0
	futures-macro-0.3.26
	futures-sink-0.3.26
	futures-task-0.3.26
	futures-util-0.3.26
	gdk-pixbuf-0.16.7
	gdk-pixbuf-sys-0.16.3
	gdk4-0.5.4
	gdk4-sys-0.5.4
	generic-array-0.14.6
	getrandom-0.2.8
	gio-0.16.7
	gio-sys-0.16.3
	glib-0.16.7
	glib-build-tools-0.17.0
	glib-macros-0.16.3
	glib-sys-0.16.3
	globset-0.4.9
	gobject-sys-0.16.3
	graphene-rs-0.16.3
	graphene-sys-0.16.3
	gsk4-0.5.4
	gsk4-sys-0.5.4
	gtk4-0.5.4
	gtk4-macros-0.5.4
	gtk4-sys-0.5.4
	hashbrown-0.13.2
	heck-0.4.0
	hermit-abi-0.2.6
	hex-0.4.3
	hmac-0.12.1
	ident_case-1.0.1
	ignore-0.4.18
	instant-0.1.12
	intl-memoizer-0.5.1
	intl_pluralrules-7.0.2
	itoa-1.0.5
	jobserver-0.1.25
	js-sys-0.3.60
	kinda-virtual-fs-0.1.1
	lazy_static-1.4.0
	libadwaita-0.2.1
	libadwaita-sys-0.2.1
	libc-0.2.139
	libz-sys-1.1.8
	lock_api-0.4.9
	log-0.4.17
	lzma-sys-0.1.20
	malloc_buf-0.0.6
	md-5-0.10.5
	md5-asm-0.5.0
	memchr-2.5.0
	memoffset-0.6.5
	memoffset-0.7.1
	miniz_oxide-0.6.2
	nanorand-0.7.0
	nix-0.23.2
	ntapi-0.4.0
	nu-ansi-term-0.46.0
	num-bigint-0.4.3
	num-integer-0.1.45
	num-traits-0.2.15
	num_cpus-1.15.0
	num_enum-0.5.11
	num_enum_derive-0.5.11
	objc-0.2.7
	objc-foundation-0.1.1
	objc_id-0.1.1
	once_cell-1.17.1
	opaque-debug-0.3.0
	openssl-probe-0.1.5
	openssl-sys-0.9.80
	ordered-stream-0.0.1
	overload-0.1.1
	pango-0.16.5
	pango-sys-0.16.3
	parking-2.0.0
	parking_lot-0.12.1
	parking_lot_core-0.9.6
	password-hash-0.4.2
	pbkdf2-0.11.0
	pest-2.5.2
	pin-project-1.0.12
	pin-project-internal-1.0.12
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.26
	polling-2.5.2
	pollster-0.2.5
	ppv-lite86-0.2.17
	proc-macro-crate-1.2.1
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro-hack-0.5.20+deprecated
	proc-macro2-1.0.49
	quote-1.0.23
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.4
	raw-window-handle-0.5.0
	rayon-1.6.1
	rayon-core-1.10.1
	redox_syscall-0.2.16
	redox_users-0.4.3
	regex-1.7.0
	regex-syntax-0.6.28
	relm4-0.5.0
	relm4-macros-0.5.0
	remove_dir_all-0.5.3
	rfd-0.11.1
	ring-0.16.20
	rustc-hash-1.1.0
	rustc_version-0.3.3
	rustc_version-0.4.0
	rustls-0.20.8
	rustls-ffi-0.8.2
	rustls-pemfile-0.2.1
	ryu-1.0.12
	same-file-1.0.6
	schannel-0.1.20
	scopeguard-1.1.0
	sct-0.7.0
	self_cell-0.10.2
	semver-0.11.0
	semver-1.0.16
	semver-parser-0.10.2
	serde-1.0.151
	serde_derive-1.0.151
	serde_json-1.0.91
	serde_repr-0.1.10
	sha1-0.10.5
	sha1-0.6.1
	sha1_smol-1.0.0
	sha2-0.10.6
	sharded-slab-0.1.4
	slab-0.4.7
	smallvec-1.10.0
	snafu-0.7.4
	snafu-derive-0.7.4
	socket2-0.4.7
	spin-0.5.2
	spin-0.9.4
	static_assertions-1.1.0
	strsim-0.10.0
	subtle-2.4.1
	syn-1.0.107
	sysinfo-0.28.0
	system-deps-6.0.3
	tar-0.4.38
	tempfile-3.3.0
	thiserror-1.0.38
	thiserror-impl-1.0.38
	thread_local-1.1.4
	time-0.3.17
	time-core-0.1.0
	time-macros-0.2.6
	tinystr-0.7.0
	tokio-1.25.0
	tokio-macros-1.8.2
	toml-0.5.10
	tracing-0.1.37
	tracing-attributes-0.1.23
	tracing-core-0.1.30
	tracing-log-0.1.3
	tracing-subscriber-0.3.16
	type-map-0.4.0
	typenum-1.16.0
	ucd-trie-0.1.5
	uds_windows-1.0.2
	unic-langid-0.9.1
	unic-langid-impl-0.9.1
	unic-langid-macros-0.9.1
	unic-langid-macros-impl-0.9.1
	unicode-ident-1.0.6
	untrusted-0.7.1
	urlencoding-2.1.2
	uuid-0.8.2
	valuable-0.1.0
	vcpkg-0.2.15
	version-compare-0.1.1
	version_check-0.9.4
	waker-fn-1.1.0
	walkdir-2.3.2
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.83
	wasm-bindgen-backend-0.2.83
	wasm-bindgen-futures-0.4.33
	wasm-bindgen-macro-0.2.83
	wasm-bindgen-macro-support-0.2.83
	wasm-bindgen-shared-0.2.83
	web-sys-0.3.60
	webpki-0.22.0
	wepoll-ffi-0.1.2
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	wincompatlib-0.2.1
	windows-0.44.0
	windows-sys-0.36.1
	windows-sys-0.42.0
	windows-targets-0.42.1
	windows_aarch64_gnullvm-0.42.1
	windows_aarch64_msvc-0.36.1
	windows_aarch64_msvc-0.42.1
	windows_i686_gnu-0.36.1
	windows_i686_gnu-0.42.1
	windows_i686_msvc-0.36.1
	windows_i686_msvc-0.42.1
	windows_x86_64_gnu-0.36.1
	windows_x86_64_gnu-0.42.1
	windows_x86_64_gnullvm-0.42.1
	windows_x86_64_msvc-0.36.1
	windows_x86_64_msvc-0.42.1
	xattr-0.2.3
	xz-0.1.0
	xz2-0.1.7
	zbus-2.3.2
	zbus_macros-2.3.2
	zbus_names-2.5.0
	zip-0.6.3
	zstd-0.11.2+zstd.1.5.2
	zstd-safe-5.0.2+zstd.1.5.2
	zstd-sys-2.0.4+zstd.1.5.2
	zvariant-3.11.0
	zvariant_derive-3.11.0
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
	virtual/libc
	sys-auth/polkit
"

RDEPEND="
	${DEPEND}
	!!games-misc/an-anime-game-launcher-gtk
"

BDEPEND=">=virtual/rust-1.63"

inherit cargo xdg-utils desktop

DESCRIPTION="Anime Game launcher with automatic anti-cheat patching"
HOMEPAGE="https://github.com/an-anime-team/an-anime-game-launcher"
SRC_URI="
	https://github.com/an-anime-team/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/an-anime-team/anime-launcher-sdk/archive/${anime_launcher_sdk_commit}.tar.gz
	https://github.com/an-anime-team/anime-game-core/archive/${anime_game_core_commit}.tar.gz
	https://github.com/an-anime-team/components/archive/${components_commit}.tar.gz
	$(cargo_crate_uris)
"

LICENSE="GPL-3"
# Dependent crate licenses
LICENSE+="
 Apache-2.0 BSD CC0-1.0 GPL-3 ISC MIT Unicode-DFS-2016 ZLIB
"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

src_unpack() {
	cargo_src_unpack
	# renaming the git submodules and linking them where cargo expects them
	rm -rf "${S}"/anime-launcher-sdk || die
	mv "${WORKDIR}"/anime-launcher-sdk-* "${WORKDIR}/anime-launcher-sdk" || die
	ln -s "${WORKDIR}/anime-launcher-sdk" "${S}"/anime-launcher-sdk || die
	rm -rf "${S}"/anime-launcher-sdk/anime-game-core || die
	mv "${WORKDIR}"/anime-game-core-* "${WORKDIR}/anime-launcher-sdk/anime-game-core" || die
	ln -s "${WORKDIR}/anime-game-core" "${S}"/anime-launcher-sdk/anime-game-core || die
	rm -rf "${S}"/anime-launcher-sdk/components || die
	mv "${WORKDIR}"/components-* "${WORKDIR}/anime-launcher-sdk/components" || die
	ln -s "${WORKDIR}/components" "${S}"/anime-launcher-sdk/components || die
}

src_prepare() {
	default
	# patch the .desktop file to work in non-AppImage environment
	sed -i 's/Icon=icon/Icon=anime-game-launcher/' assets/anime-game-launcher.desktop || die
	sed -i 's/Exec=AppRun/Exec=anime-game-launcher/' assets/anime-game-launcher.desktop || die
	# avoid stripping by the build system, we do that ourselves in Gentoo
	sed -i 's/strip = true/strip = false/' Cargo.toml || die
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
