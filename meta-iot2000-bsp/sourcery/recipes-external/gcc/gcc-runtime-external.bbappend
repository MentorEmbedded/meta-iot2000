addtask unpack after do_fetch

FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
SRC_URI += "file://libstdc++6_${GCC_VERSION}-r0.0_${TUNE_PKGARCH}.tar.bz2;subdir=prebuilt"

do_install_extra_append () {
    rm -fv ${D}${libdir}/libstdc++.so.6*
    cp -av ${WORKDIR}/prebuilt/*/. ${D}/
}

INSANE_SKIP_${PN} += "already-stripped"
