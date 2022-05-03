# An Anime Game Launcher Gentoo

## Installation

### Adding the repository

To install the launcher with Portage, you have to add this gitlab repo into portage's repositories.

#### With eselect-repository

If you haven't already, emerge [eselect-repository](https://wiki.gentoo.org/wiki/Eselect/Repository) with
```
emerge --ask app-eselect/eselect-repository
```

Now add the repository with
```
eselect repository add The-Anime-Game git https://gitlab.com/an-anime-team/aagl-ebuilds.git
emerge --sync
```

#### Manually

If /etc/portage/repos.conf is a file, add the following lines to that file, if /etc/portage/repos.conf is a directory, add a new file with file `touch /etc/portage/repos.conf/theanimegame.conf` and put the following into it:
```
[The-Anime-Game]
location = /var/db/repos/theanimegame
sync-type = git
sync-uri = https://gitlab.com/an-anime-team/aagl-ebuilds.git
priority = 100
```

Now sync the now ebuild with `emerge --sync`

### Installing the launcher
After adding the repository emerge the an-anime-game-launcher-bin package.
This can take a while if you dont have wine or webkit-gtk installed.
```
emerge --ask games-misc/an-anime-game-launcher-bin
```


## Uninstallation

To uninstall just deselect the package
```
emerge --deselect an-anime-game-launcher-bin
emerge --depclean
```

And remove the repository with

```
rm /etc/portage/repos.conf/theanimegame.conf
```
or
```
eselect repository disable -f The-Anime-Game
```
respectively.
