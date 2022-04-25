# An Anime Game Launcher Gentoo

## Installation

To install the launcher with Portage you must add the Repo first
edit the following file
/etc/portage/repos.conf/theanimegame.conf
```
[The-Anime-Game]
location = /var/db/repos/theanimegame
sync-type = git
sync-uri = https://gitlab.com/an-anime-team/aagl-ebuilds.git
priority = 100
```

After adding the repo emerge the an-anime-game-launcher-bin package
this will take a long time if you dont have wine or webkit-gtk installed

```
emerge --ask an-anime-game-launcher-bin
```


## Uninstall

To uninstall just deslect the package and remove the repo

```
emerge --deselect an-anime-game-launcher-bin
emerge --depclean
rm -rf /etc/portage/repos.conf/theanimegame.conf
```

```

