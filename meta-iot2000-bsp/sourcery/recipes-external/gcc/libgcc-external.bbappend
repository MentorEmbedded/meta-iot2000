FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
SRC_URI += "file://libgcc1_${GCC_VERSION}-r0.0_${TUNE_PKGARCH}.tar.bz2;subdir=prebuilt"

do_install_extra () {
    rm -fv ${D}${base_libdir}/libgcc_s.so.1
    cp -av */. ${D}/
}
do_install_extra[dirs] = "${S}/prebuilt"

INSANE_SKIP_${PN} += "already-stripped"
