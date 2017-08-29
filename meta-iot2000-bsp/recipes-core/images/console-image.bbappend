require core-image-iot2000.inc

do_bootimg[depends] += "acpi-upgrades:do_deploy"
