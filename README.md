btsync-autoconfig
=================
Auto-create [BitTorrent Sync][btsync] config files on demand

This repository contains systemd service scripts for automatically creating
config files if needed when the `btsync` user service starts.


Building
--------

The project consists of only shell scripts, to there is nothing to
compile!


Installation
------------

Clone the repo (`master` or `source` branch) and use `make`:

    # make install

This will install files into the following directories:

 - `/usr/lib/systemd/user/`
 - `/usr/share/btsync-autoconfig`

Finally, enable the service:

    # systemctl --global enable btsync-autoconfig.service


Packaging for pacman
--------------------

btsync-autoconfig is [available from the AUR][aur]. BitTorrent Sync with systemd
service definitions is provided by the [`btsync` AUR package][aur-btsync].

You can also easily build the package yourself: Download all files in the
`pacman` directory, the rest will be downloaded automatically. Place them
anywhere, for instance in `~/downloads/btsync-autoconfig`. Run
[`makepkg`][makepkg] in that directory, then install the built package with
`pacman -U btsync-autoconfig-VERSION.tar.xz`.

    $ cd ~/downloads/btsync-autoconfig
    $ makepkg
    # packan -U btsync-autoconfig-VERSION.tar.xs

Alternatively, you can use `makepkg -i` as a shortcut combining the last two
commands into one.


License
-------

btsync-autoconfig is licensed under the [GNU General Public License][gpl-home],
version 2 or later.


[arch]: https://www.archlinux.org
[aur]: https://aur.archlinux.org/packages/btsync-autoconfig
[aur-btsync]: https://aur.archlinux.org/packages/btsync
[btsync]: http://labs.bittorrent.com/experiments/sync.html
[gpl-home]: http://www.gnu.org/licenses/
[makepkg]: https://wiki.archlinux.org/index.php/Makepkg
[pacman]: https://wiki.archlinux.org/index.php/Pacman
