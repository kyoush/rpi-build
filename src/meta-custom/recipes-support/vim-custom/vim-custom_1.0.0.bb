DESCRIPTION = "Custom Vim configuration"
LICENSE = "CLOSED"

SRC_URI += "file://vimrc \
            file://hogefile \
            "

S = "${WORKDIR}/${BP}"
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
INHIBIT_DEFAULT_DEPS = "1"

do_install() {
    echo "S: ${S}"
    echo "WORKDIR: ${WORKDIR}"
    ls ${WORKDIR}
    install -D -v -m 0755 ${WORKDIR}/hogefile ${D}${ROOT_HOME}/
    install -D -v -m 0755 ${WORKDIR}/vimrc ${D}${ROOT_HOME}/
}

FILES_${PN} += "${ROOT_HOME}/*"
