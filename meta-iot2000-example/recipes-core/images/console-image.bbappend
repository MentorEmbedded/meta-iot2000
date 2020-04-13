require recipes-core/images/core-image-minimal.bb
require iot2000-example-image.inc
ROOTFS_RO_UNNEEDED = "base-passwd shadow ${VIRTUAL-RUNTIME_update-alternatives} ${ROOTFS_BOOTSTRAP_INSTALL}"

