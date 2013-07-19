# Patching the Linux Kernel

The Linux Kernel is just another recipe for Yocto, so learning to patch it you learn
to patch any other package. In the other hand, Yocto **should not** be used for 
package development, but in those rare cases follow the below steps. It is assumed
that you have already build the package you want to patch. 

1. Create the patch or patches. In this example we are patching the
Linux kernel for [wandboard-dual](http://www.wandboard.org/) machine; in other
words, the value of MACHINE on the `build/conf/local.conf` is `MACHINE ??= 'wandboard-dual'`.
In case you already have the patches, make sure these can be nicely applied with the commands `git apply --check <PATCH_NAME>`, and jump
this step

~~~~{.bash}
build $ cd tmp/work/wandboard_dual-poky-linux-gnueabi/linux-wandboard/3.0.35-r0/git
build $ # Edit any files you want to change
build $ git add <modified file 1> <modified file 2> .. 	# Select the files you want to commit
build $ git commit -s -m '<your commit's title>'		# Create the commit
build $ git format-patch -1								# Create the patch
~~~~

2. Create a new layer (see section 'Creating a new Layer')

3. On the new layer (e.g `meta-fsl-custom`) , create the corresponding subfolders and the `.bbfile`

~~~~ {.bash}
sources $ mkdir -p meta-fsl-custom/recipes-kernel/linux/linux-wandboard-3.0.35/
sources $ cat > meta-fsl-custom/recipes-kernel/linux/linux-wandboard_3.0.35.bbappend
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"
SRC_URI += "file://0001-calibrate-Add-printk-example.patch"
PRINC := "${@int(PRINC) + 1}"
^d
~~~~

4. Move the patch to the new layer

~~~~{.bash}
sources $ cp \
../build/tmp/work/wandboard_dual-poky-linux-gnueabi/linux-wandboard/3.0.35-r0/git/0001-calibrate-Add-printk-example.patch \
meta-fsl-custom/recipes-kernel/linux/linux-wandboard-3.0.35
~~~~


5. Setup the enviroment and clean previous package's build data (sstate)

~~~~{.bash}
fsl-community-bsp $ . setup-environment build
build $ bitbake -c cleansstate linux-wandboard
~~~~

6. Compile and Deploy

~~~~
build $ bitbake -f -c compile linux-wandboard
build $ bitbake -c deploy linux-wandboard
~~~~

7. Insert the SD into your Host and copy the `uImage` into the first partition. Do not
forget to unmount the partition before removing the card!

~~~~{.bash}
build $ sudo cp tmp/deploy/images/uImage /media/Boot\ wandbo/
~~~~

8. Insert the SD into your board and test your change. 
