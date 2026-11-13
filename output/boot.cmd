setenv bootargs 'console=ttyS0,115200 console=tty0 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait init=/sbin/init noinitrd panic=10 ${extra}'
fatload mmc 0 0x48000000 uImage
fatload mmc 0 0x49000000 sun8i-r16-clockworkpi-cpi3.dtb
bootm 0x48000000 - 0x49000000