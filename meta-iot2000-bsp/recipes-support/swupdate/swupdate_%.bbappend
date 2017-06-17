FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

PACKAGECONFIG_CONFARGS = ""

SRC_URI += " \
     file://swupdate.cfg \
     "

SRCREV = "${AUTOREV}"

do_install_append() {
    install -d ${D}${bindir}
    install -m 755 ${S}/progress ${D}${bindir}
    install -d ${D}${sysconfdir}
    install -m 644 ${WORKDIR}/swupdate.cfg ${D}${sysconfdir}
}
