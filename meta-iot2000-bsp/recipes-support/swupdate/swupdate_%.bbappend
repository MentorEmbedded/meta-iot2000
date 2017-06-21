FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

PACKAGECONFIG_CONFARGS = ""

SRC_URI += " \
     file://0001-Provide-a-dummy-file-backed-bootloader-interface.patch \
     file://hwrevision \
     file://swupdate.cfg \
     file://swupdate-env \
     "

SRCREV = "${AUTOREV}"

do_install_append() {
    install -d ${D}${bindir}
    install -m 755 ${S}/progress ${D}${bindir}
    install -m 755 ${WORKDIR}/swupdate-env ${D}${bindir}
    install -d ${D}${sysconfdir}
    install -m 644 ${WORKDIR}/hwrevision ${D}${sysconfdir}
    install -m 644 ${WORKDIR}/swupdate.cfg ${D}${sysconfdir}
}
