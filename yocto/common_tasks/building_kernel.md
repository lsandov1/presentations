# Building the Kernel Manually

1. To setup the Yocto environment, from the BASE folder run

~~~~{.bash}
fsl-community-bsp $ . setup-environment build
~~~~

2. Build the toolchain

~~~~{.bash}
build $ bitbake meta-toolchain
# Other toolchains:
#   Qt Embedded toolchain build: bitbake meta-toolchain-qte
#   Qt X11 toolchain build: bitbake meta-toolchain-qt
~~~~

3. Install it on your PC

~~~~{.bash}
build $ sudo sh \
    tmp/deploy/sdk/poky-eglibc-x86_64-arm-toolchain-<version>.sh
~~~~

4. Setup the toolchain environment

~~~~{.bash}
build $ source \
    /opt/poky/<version>/environment-setup-armv7a-vfp-neon-poky-linux-gnueabi
~~~~

5. Get the Linux Kernel's source code.

~~~~{.bash}
$ git clone git://git.freescale.com/imx/linux-2.6-imx.git linux-imx
$ cd linux-imx
~~~~

6. Create a local branch

~~~~{.bash}
linux-imx $ BRANCH=imx_3.0.35_4.0.0 # Change to any branch you want,
                                    # Use 'git branch -a' to list all
linux-imx $ git checkout -b ${BRANCH} origin/${BRANCH}
~~~~

7. Export ARCH and CROSS_COMPILE

~~~~{.bash}
linux-imx $ export ARCH=arm  
linux-imx $ export CROSS_COMPILE=arm-poky-linux-gnueabi-
linux-imx $ unset LDFLAGS
~~~~

8. Choose configuration and compile

~~~~{.bash}
linux-imx $ make imx6_defconfig  
linux-imx $ make uImage  
~~~~

9. To Test your changes, copy the `uImage` into your SD Card

~~~~{.bash}
linux-imx $ sudo cp arch/arm/boot/uImage /media/boot
~~~~

10. If case you want your changes to be reflected on your Yocto Framework, create the patches following the section 'Patching the kernel'.
