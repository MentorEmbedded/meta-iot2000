FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

PACKAGECONFIG_CONFARGS = ""

SRC_URI += " \
     file://add-ebg-support.patch \
     file://rawfile-check-if-files-are-the-same.patch \
     file://hwrevision \
     file://swupdate.cfg \
     file://swupdate-env \
     "

SRCREV = "37a0328d8a8446d5a3d26b80034660390dcc871a"

DEPENDS += " \
    efibootguard \
    parted \
"

do_install_append() {
    install -d ${D}${bindir}
    install -m 755 ${WORKDIR}/swupdate-env ${D}${bindir}
    install -d ${D}${sysconfdir}
    install -m 644 ${WORKDIR}/hwrevision ${D}${sysconfdir}
    install -m 644 ${WORKDIR}/swupdate.cfg ${D}${sysconfdir}
}

do_compile() {
  unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
  oe_runmake swupdate_unstripped
  cp swupdate_unstripped swupdate
}
