DESCRIPTION = "Custom Vim configuration"
LICENSE = "CLOSED"

SRC_URI = "file://vimrc \
           "

FILESEXTRAPATHS:prepend :=  "${THISDIR}/${PN}:"
INHIBIT_DEFAULT_DEPS = "1"

do_install() {
    echo "WORKDIR: ${WORKDIR}"
    echo "systemd_system_unitdir: ${systemd_system_unitdir}"
    echo "sysconfdir: ${sysconfdir}"
    echo "THISDIR: ${THISDIR}"
    echo "PN: ${PN}"
    echo "S: ${S}"
    echo " ==== ls -lFA \${WORKDIR} === "
    ls -lFA ${WORKDIR}
    echo " ======================= "
    echo " ==== ls /${S} === "
    ls ${S}
    echo " ======================= "
    install -d ${D}${systemd_system_unitdir}/vim
    install -m 0644 ${WORKDIR}/vimrc ${D}${sysconfdir}/vim/.vimrc
}

FILES_${PN} += "${sysconfdir}/vim/.vimrc"
