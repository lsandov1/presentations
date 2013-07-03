# Build and Boot your Freescale Yocto Image in 8 Steps

1. Check [required](http://www.yoctoproject.org/docs/1.4/ref-manual/ref-manual.html#required-packages-for-the-host-development-system) packages for your Linux Distribution and install them

2. Install the [repo](http://source.android.com/source/developing.html) utility following
these steps

~~~~ {.bash}
$ mkdir ~/bin
$ curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo
$ chmod a+x ~/bin/repo
$ PATH=${PATH}:~/bin
~~~~

3. Download the BSP source

~~~~ {.bash}
$ mkdir fsl-community-bsp
$ cd fsl-community-bsp
$ repo init -u https://github.com/Freescale/fsl-community-bsp-platform -b dylan
$ repo sync
~~~~

4. Prepare the bitbake's enviroment

~~~~ {.bash}
$ . ./setup-environment build
build $
~~~~

5. Choose machine and image

~~~~ {.bash}
# To list all FSL related machines, type
build $ find ../sources/meta-fsl* -name "*.conf" | grep "conf/machine"

# To list all possible images, type
build $ bitbake-layers show-recipes | grep image
~~~~

6. Bake

~~~~ {.bash}
build $ MACHINE=<selected machine> bitbake <selected image>
# e.g MACHINE=imx6qsabresd bitbake core-image-minimal
~~~~

7. Flash

~~~~ {.bash}
# Insert your SD Card
# Type '$ dmesg | tail' to see the device node being used, e.g /dev/sdb)
# In case SD to be flash has already some partitions, the host system may have 
# mounted these, so unmount them, e.g. '$ sudo umount /dev/sdb?'.
build $ ls -la 'tmp/deploy/images/*.sdcard'

# Flash the soft link one
build $ sudo dd if=tmp/deploy/images/<selected image>-<select machine>.sdcard of=/dev/sdX bs=1M
~~~~

8. Place your SD Card in the correct board's slot and boot!

Found Errors? Subscribe and report it to [meta-freescale](https://lists.yoctoproject.org/listinfo/meta-freescale) list

[Back to Menu](./menu.html#(2))
