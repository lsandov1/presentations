# Creating a new (Board Specific Package) Layer

You **do not** need to create a new layer if

* your board is a Freescale's ARM based platform. For this case, add your content
directly into the Board Specific Packate layer called `meta-fsl-arm-extra`. 

* it is already implemented. To check this, see the list of available [layers](http://layers.openembedded.org/layerindex/layers/). If found, download the layer and add it to the `conf/bblayers.conf` file


You need to create a new layer when creating or modifing new package(s). There are many 
reasons to create a layer, the most important is that your work will not pollute any other
layer, so if issues are presented during the development process, it is likely that you
have introduced these in your custom layer.


1. Create a `meta-` folder (e.g. `meta-fsl-custom`) under the `sources` folder

~~~~{.bash}
$ cd $BASE/sources
$ mkdir meta-fsl-custom
# it would be much better if your layer is under git control, so instead of
# creating a folder you would be cloning your repo (e.g git clone ...)
~~~~

3. Create the layer configuration file: `meta-fsl-custom/conf/layer.conf`

~~~~{.bash}
$ mkdir -p meta-fsl-custom/conf
$ cat > meta-fsl-custom/conf/layer.conf
# We have a conf and classes directory, add to BBPATH
BBPATH .= ":${LAYERDIR}"

# We have a packages directory, add to BBFILES
BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
            ${LAYERDIR}/recipes-*/*/*.bbappend"

BBFILE_COLLECTIONS += "fsl-custom"
BBFILE_PATTERN_fsl-custom := "^${LAYERDIR}/"
BBFILE_PRIORITY_fsl-custom = "4"
^d
~~~~

4. Add content any content you want (images, recipes, appends, classes, etc.)

5. Add the layer to the `build/conf/bblayers.conf` file

~~~~{.python}
LCONF_VERSION = "6"

BBPATH = "${TOPDIR}"
BSPDIR := "${@os.path.abspath(os.path.dirname(d.getVar('FILE', True)) + '/../..')}"

BBFILES ?= ""
BBLAYERS = " \
  ${BSPDIR}/sources/poky/meta \
  ${BSPDIR}/sources/poky/meta-yocto \
  \
  ${BSPDIR}/sources/meta-openembedded/meta-oe \
  \
  ${BSPDIR}/sources/meta-fsl-arm \
  ${BSPDIR}/sources/meta-fsl-arm-extra \
  ${BSPDIR}/sources/meta-fsl-demos \
  ${BSPDIR}/sources/meta-fsl-custom \
"
~~~~

6. To verify that your layer is *seen* by BitBake, run the following script

~~~~{.bash}
$ bitbake-layers show-layers
layer                 path                                      priority
==========================================================================
meta                  /home/b42214/fsl/yocto/fsl-community-bsp-dylan/sources/poky/meta  5
meta-yocto            /home/b42214/fsl/yocto/fsl-community-bsp-dylan/sources/poky/meta-yocto  5
meta-oe               /home/b42214/fsl/yocto/fsl-community-bsp-dylan/sources/meta-openembedded/meta-oe  6
meta-fsl-arm          /home/b42214/fsl/yocto/fsl-community-bsp-dylan/sources/meta-fsl-arm  5
meta-fsl-arm-extra    /home/b42214/fsl/yocto/fsl-community-bsp-dylan/sources/meta-fsl-arm-extra  4
meta-fsl-demos        /home/b42214/fsl/yocto/fsl-community-bsp-dylan/sources/meta-fsl-demos  4
meta-fsl-custom       /home/b42214/fsl/yocto/fsl-community-bsp-dylan/sources/meta-fsl-custom  4
~~~~
