# Workaround for localtime file conflict between systemd and tzdata

do_install_append() {
        rm -vf ${D}/etc/localtime
}

