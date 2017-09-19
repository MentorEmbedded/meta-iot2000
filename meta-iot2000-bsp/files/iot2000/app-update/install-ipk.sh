#!/bin/sh

do_postinst()
{
    local result

    opkg install /tmp/*.ipk
    result=${?}

    rm -f /tmp/*.ipk
    sync

    exit ${result}
}

case "${1}" in
preinst)
    exit 0
    ;;
postinst)
    do_postinst
    ;;
*)
    exit 1
    ;;
esac
