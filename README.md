bittorrent-sync
===============

AUR packaging of BitTorrent Sync
--------------------------------
This is the source code behind the [bittorrent-sync AUR package][aur]. It
contains scripts for packaging [BitTorrent Sync][btsync] for use with
[Arch Linux][arch]'s [pacman][pacman] package manager. 

[aur]: https://aur.archlinux.org/packages/bittorrent-sync
[btsync]: http://labs.bittorrent.com/experiments/sync.html
[arch]: https://www.archlinux.org
[pacman]: https://wiki.archlinux.org/index.php/Pacman

Building
========

Download the `PKGBUILD` file and place it anywhere, for instance in
`~/downloads/bittorrent-sync`. Run [`makepkg`][makepkg] in that location, then
install the built package with `pacman -U bittorrent-sync-VERSION.tar.xz`.

    $ cd ~/downloads/bittorrent-sync
    $ makepkg
    $ packan -U bittorrent-sync-VERSION.tar.xs

[makepkg]: https://wiki.archlinux.org/index.php/Makepkg
