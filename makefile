DESTDIR=
PKGNAME=btsync-autoconfig

default:
	echo "Nothing to compile - nothing to do! :D"

install:
	install -D -m 755 btsync-makeconfig.sh "${DESTDIR}/usr/share/${PKGNAME}/btsync-makeconfig.sh"
	install -D -m 644 btsync-autoconfig@.service "${DESTDIR}/usr/lib/systemd/system/btsync-autoconfig@.service"
	install -D -m 644 btsync-autoconfig.user.service "${DESTDIR}/usr/lib/systemd/user/btsync.service.wants/btsync-autoconfig.service"
	install -D -m 755 btsync-autoconfig.sh "${DESTDIR}/usr/share/${PKGNAME}/btsync-autoconfig.sh"
