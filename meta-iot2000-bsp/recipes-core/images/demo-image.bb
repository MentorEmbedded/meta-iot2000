SUMMARY = "A sample demo image for the IOT2020"
LICENSE = "MIT"

IMAGE_FEATURES += "package-management"

inherit core-image

IMAGE_INSTALL += "	\
	connman		\
	lighttpd	\
	libgcc		\
	swupdate	\
"
