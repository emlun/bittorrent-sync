btsync-autoconfig
=================
Auto-create BitTorrent Sync config files on demand

This is the source code behind the [`btsync-autoconfig` AUR package][aur]. It
contains scripts for automatically creating config files if needed when the
per-user `btsync@user` systemd service, provided by the [`btsync` AUR
package][aur-btsync], starts.

It is intended for use with [Arch Linux][arch]'s [pacman][pacman] package
manager.

[aur]: https://aur.archlinux.org/packages/btsync-autoconfig
[btsync]: http://labs.bittorrent.com/experiments/sync.html
[aur-btsync]: https://aur.archlinux.org/packages/btsync
[arch]: https://www.archlinux.org
[pacman]: https://wiki.archlinux.org/index.php/Pacman

Building
--------

The project consists of only shell scripts, to there is nothing to
compile!

Packaging for pacman
--------------------

Download all files in the `pacman` directory, the rest will be
downloaded automatically. Place them anywhere, for instance in
`~/downloads/btsync-autoconfig`. Run [`makepkg`][makepkg] in that
directory, then install the built package with `pacman -U
btsync-autoconfig-VERSION.tar.xz`.

    $ cd ~/downloads/btsync-autoconfig
    $ makepkg
    $ packan -U btsync-autoconfig-VERSION.tar.xs

Alternatively, you can use `makepkg -i` as a shortcut combining the last two
commands into one.

[makepkg]: https://wiki.archlinux.org/index.php/Makepkg
