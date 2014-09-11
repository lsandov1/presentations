# Das U-boot

* The supported bootloader for `i.MX` platform

* There are others, but `U-boot` is the most adopted bootloader for embedded
systems

# Where can I get it?

* Download a recent version from the Freescale GIT repository
[site](http://git.freescale.com/git/cgit.cgi/imx/uboot-imx.git/)

* Too many versions? Do not panic, choose the latest `ga` release on the `tag`
 section

* `ga` stands for **G**eneral **A**vailability, which means stable and long time
 support from Freescale

# Configure

* Move to the folder where you unpack the bootloader

* Use the default configuration file

~~~~{.bash}
make mx6qsabresd_config
~~~~

# Compile

~~~~{.bash}
make u-boot.imx
~~~~

# Flash

* Place a SD on your host (make sure you do not have your PhD thesis in there!) 
and unmount it `sudo umount /dev/XXX?` where `XXX` could be `sdY` if
place it on a USB port or `mmcblkYp` if placed it on a SD port

* U-boot must reside on the boot device (in this case a SD card) at the address
 `0x400` so let's put it there

~~~~{.bash}
sudo dd if=u-boot.imx of=/dev/XXX seek=2 bs=512
~~~~

# Boot

* Place your SD on a *iMX6 Sabre SD* board, and set the correct switches

* Connect to the board through the serial

~~~~{.bash}
sudo picocom -b 115200 /dev/ttyUSB0
~~~~

* Power the board

# picocom

* `sudo` is dangeours, so next time do not use it. Add yourself to the dialout
group

~~~~{.bash}
sudo adduser $USER dialout
~~~~

# What is next?

* U-boot needs to fetch a kernel and place it on RAM

* The kernel can reside on the same  SD card, on another SD card inserted to
the other port of your board, on the eMMC or even on your host

* So first lets create the [kernel image](./kernel.html)

[Main Menu](./menu.html#(2))
