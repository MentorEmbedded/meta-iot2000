# location of the CodeBench sources
SOURCERY_BASE_URI = "ftp://ftpnew.alm.mentorg.com/pub/CodeBench/Released/Offline_Installers"
SOURCERY_SRC_FILE = "codebench-sources-2017.02-55-i686-pc-linux-gnu.tar.bz2"
SOURCERY_SRC_URI  = "${SOURCERY_BASE_URI}/2017.02/IA32/${SOURCERY_SRC_FILE}"

# source tarball checksums
SRC_URI[md5sum]    = "4069cc767890a2ae8773c0440a198c24"
SRC_URI[sha256sum] = "105e99ee8260b4e4602b908734e503a21b9acad71fb45476b677867e5c6af615"

# we need to extract scb-toolchain to get the glibc source tarball
unpack_libc_prepend () {
    tar jxf scb-2017.*/scb-toolchain-*.tar.bz2
}

