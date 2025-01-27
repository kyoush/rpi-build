# meta-custom/recipes-core/systemd/systemd_%.bbappend

do_install_append() {
    install -d ${D}${sysconfdir}/systemd/network
    install -m 644 ${WORKDIR}/wlan0.network ${D}${sysconfdir}/systemd/network/wlan0.network
}
