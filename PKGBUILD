# Maintainer: Emil Lundberg <lundberg.emil@gmail.com> (AUR: Lorde; GitHub: emlun)
# Contrib Repo: https://github.com/emlun/bittorrent-sync
#
# Contributor: Justin Patera serialhex@gmail.com

pkgname=btsync-autoconfig
pkgver=1.1.0
pkgrel=2
pkgdesc="Create default config files when launching btsync@user, if necessary"
arch=('any')
url='https://github.com/emlun/btsync-autoconfig'
license=('GPL')
install="${pkgname}.install"
changelog='changelog.txt'
source=("${install}"
        "${changelog}"
        "git+https://github.com/emlun/btsync-autoconfig.git#tag=${pkgver}-${pkgrel}")
md5sums=('6a1f43e5f79b8fc7dd0ec8dc5b409b4b'
         '621b38a47dd285e1030372889f671737'
         'SKIP')
sha256sums=('8e01e865795c38303202648f3ef4290787a7beb943b04244ecefd3fb822e2c65'
            '0d7fa6ca03c258556d301b1a1f4da153392e3b08d91d830608164bd9f8ca07f2'
            'SKIP')

package() {
    cd "${pkgname}"

    install -D -m 644 btsync.conf.doc "${pkgdir}/usr/share/${pkgname}/btsync.conf.doc"
    install -D -m 644 btsync-makeconfig.sh "${pkgdir}/usr/share/${pkgname}/btsync-makeconfig.sh"
    install -D -m 644 btsync-autoconfig@.service "${pkgdir}/usr/lib/systemd/system/btsync-autoconfig@.service"
    install -D -m 644 btsync-autoconfig.sh "${pkgdir}/usr/share/${pkgname}/btsync-autoconfig.sh"
}

# vim: ts=4:sw=4:et
