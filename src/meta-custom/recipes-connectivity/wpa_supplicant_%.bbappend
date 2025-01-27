# meta-custom/recipes-connectivity/wpa_supplicant/wpa_supplicant_%.bbappend

do_install_append() {
    install -d ${D}${sysconfdir}/wpa_supplicant
    install -m 600 ${WORKDIR}/wpa_supplicant.conf ${D}${sysconfdir}/wpa_supplicant/wpa_supplicant.conf

    install -d ${D}${systemd_system_unitdir}
    install -m 644 ${WORKDIR}/wpa_supplicant@.service ${D}${systemd_system_unitdir}/wpa_supplicant@.service
}
