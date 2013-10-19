# Maintainer: Emil Lundberg <lundberg.emil@gmail.com> (AUR: Lorde; GitHub: emlun)
# Contrib Repo: https://github.com/emlun/bittorrent-sync
#
# Contributor: Justin Patera serialhex@gmail.com

pkgname=bittorrent-sync-autoconfig
pkgver=1.0.0
pkgrel=1
pkgdesc="Create default config files when launching btsync@user, if necessary"
arch=('any')
url='https://github.com/emlun/bittorrent-sync'
license=('GPL')
replaces=('bittorrent-sync')
install="${pkgname}.install"
source=("${pkgname}.install"
        'btsync-autoconfig@.service'
        'btsync-makeconfig.sh'
        'btsync-autoconfig.sh'
        'btsync.conf.doc')
sha256sums=('3555bbab0e6b5619063b371bfb1fd37368ef2c76b145209e37690f5ae760074f'
            '441a1a668bc8f6ec12ce4e149248776ede062cb0933a61c4e6ee8bd4f619be7d'
            '6e3d9a4260824fa8077ff8fdbc4ae61f53fa702a08735018286cb52bcea49824'
            'b0c7285175b389c4cdda76f07709b598405834ffa906269a80a03d2ca143dd26'
            'de4f2a124d56ddbaec23535a250dbe9001606f47b74f3c3c97056107b21c7f6e')

package() {
    cd "${srcdir}"

    install -D -m 644 btsync.conf.doc "${pkgdir}/usr/share/${pkgname}/btsync.conf.doc"
    install -D -m 644 btsync-makeconfig.sh "${pkgdir}/usr/share/${pkgname}/btsync-makeconfig.sh"
    install -D -m 644 btsync-autoconfig@.service "${pkgdir}/usr/lib/systemd/system/btsync-autoconfig@.service"
    install -D -m 644 btsync-autoconfig.sh "${pkgdir}/usr/share/${pkgname}/btsync-autoconfig.sh"
}

# vim: ts=4:sw=4:et
