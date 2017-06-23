#!/bin/sh

do_postinst()
{
    set -e

    # Get "active" and "backup" partitions
    active=`readlink -f /dev/disk/by-label/pf_active`
    backup=`readlink -f /dev/disk/by-label/pf_backup`

    # Update boot partition
    sed -i -e s,${active},${backup},g /run/media/efi/loader/entries/boot.conf
    sync

    # Swap roles
    e2label ${backup} pf_active
    e2label ${active} pf_backup
    sync

    exit 0
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

