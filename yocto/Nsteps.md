# Build and Boot your Freescale Yocto Image in 8 steps

1. Check [required](http://www.yoctoproject.org/docs/1.4/ref-manual/ref-manual.html#required-packages-for-the-host-development-system) packages for your Linux Distribution and install them

2. Install the [repo](http://source.android.com/source/developing.html) utility following
these steps

~~~~ {.bash}
$ mkdir ~/bin
$ curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo
$ chmod a+x ~/bin/repo
$ PATH=${PATH}:~/bin
~~~~

3. Download the BSP metadata (recipes + configuration files + classes)

~~~~ {.bash}
$ mkdir fsl-community-bsp
$ cd fsl-community-bsp
fsl-community-bsp $ repo init -u https://github.com/Freescale/fsl-community-bsp-platform -b dylan
fsl-community-bsp $ repo sync # Takes some minutes the first time 
~~~~

4. Select your machine and prepare the bitbake's environment

~~~~ {.bash}
# To list all FSL related machines, type
fsl-community-bsp $ find sources/meta-fsl* -name "*.conf" | grep "conf/machine"
fsl-community-bsp $ MACHINE=<selected machine> . ./setup-environment build
# if MACHINE is not set, the default machine is 'imx6qsabresd'
build $
~~~~

5. Choose an image and bake it!

~~~~ {.bash}
build $ bitbake-layers show-recipes | grep image 	# To list all possible images
build $ bitbake <selected image>					# Bake! The first time can take several hours.
# e.g bitbake core-image-minimal
~~~~

6. Flash

~~~~ {.bash}
# Insert your SD Card
# Type '$ dmesg | tail' to see the device node being used, e.g /dev/sdb)
# In case SD to be flash has already some partitions, the host system may have 
# mounted these, so unmount them, e.g. '$ sudo umount /dev/sdb?'.
build $ ls -la 'tmp/deploy/images/*.sdcard'

# Flash the soft link one
build $ sudo dd if=tmp/deploy/images/<selected image>-<select machine>.sdcard of=/dev/sdX bs=1M
~~~~

7. Place your SD Card in the correct board's slot and boot!

Found Errors? Subscribe and report it to [meta-freescale](https://lists.yoctoproject.org/listinfo/meta-freescale) list

[Back to Menu](./menu.html#(2))