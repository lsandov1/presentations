# Metadata/input

# Metadata

BitBake handles the parsing and execution of the data files. The data itself is of various types:

* Recipes: Provides details about particular pieces of software.
* Class Data: Abstracts common build information (e.g. how to build a Linux kernel).
* Configuration Data: Defines machine-specific settings, policy decisions, and so forth. Configuration data acts as the glue to bind everything together.


# User and Machine (BSP) Configuration

Configuration Data:

* `build/conf/local.conf`: Local User Configuration for your build environment
* `build/conf/bblayers.conf`: Define layers, which are directory trees, traversed by BitBake.
* `sources/meta-*/conf/layer.conf`: Layer configuration file
* `sources/meta-*/conf/machine/*.conf`: Machine configuration files


# User Configuration file: `build/conf/local.conf`

~~~~{.python}
MACHINE ??= 'wandboard-dual'
DISTRO ?= 'poky'
#PACKAGE_CLASSES ?= "package_rpm"
EXTRA_IMAGE_FEATURES = "debug-tweaks"
USER_CLASSES ?= "buildstats image-mklibs image-prelink"
PATCHRESOLVE = "noop"
BB_DISKMON_DIRS = "\
    STOPTASKS,${TMPDIR},1G,100K \
    STOPTASKS,${DL_DIR},1G,100K \
    STOPTASKS,${SSTATE_DIR},1G,100K \
    ABORT,${TMPDIR},100M,1K \
    ABORT,${DL_DIR},100M,1K \
    ABORT,${SSTATE_DIR},100M,1K" 
CONF_VERSION = "1"

BB_NUMBER_THREADS = '4'
PARALLEL_MAKE = '-j 4'
ACCEPT_FSL_EULA = ""
#added by bitbake
DL_DIR = "/home/b42214/fsl-local/yocto/fsl-community-bsp-dylan/downloads/"
#added by bitbake
SSTATE_MIRRORS = ""
#added by bitbake
PACKAGE_CLASSES = "package_rpm"
~~~~

Important variables:

* `MACHINE`: Indicates the machine, `imx6qsabresd` is the default
* `BB_NUMBER_THREADS` and `PARALLEL_MAKE`: Indicate the max number of threads when baking and compiling
* `DL_DIR`: Tarball repository. Several users can share the same folder, so data can be reused.

# Layer selection file: `build/conf/bblayers.conf`

* Automatically created by the `setup-environment` script (see section 'Build & Boot your FSL Yocto Image in N Steps')

* Only modified when adding a new layer

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
"
~~~~

# Layer configuration file: `meta-fsl-arm/conf/layer.conf`

~~~~{.python}
# We have a conf and classes directory, add to BBPATH
BBPATH .= ":${LAYERDIR}"

# We have a packages directory, add to BBFILES
BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
            ${LAYERDIR}/recipes-*/*/*.bbappend"

BBFILE_COLLECTIONS += "fsl-arm"
BBFILE_PATTERN_fsl-arm := "^${LAYERDIR}/"
BBFILE_PRIORITY_fsl-arm = "5"

FSL_EULA_FILE = "${LAYERDIR}/EULA"

FSL_MIRROR ?= "http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/"

MIRRORS += " \
${FSL_MIRROR}	http://download.ossystems.com.br/bsp/freescale/source/ \n \
"
~~~~

Important variables:

* `BBFILES`: Indicates where to look for `.bb*` files
* `BBFILE_PRIORITY_fsl-arm`: Indicates layer's priority
* `MIRRORS`: Indicates where to get the source code


# Machine configuration file: `meta-fsl-arm/conf/imx6qsabresd.conf`

~~~~{.python}
#@TYPE: Machine
#@NAME: i.MX6Q SABRE SD
#@DESCRIPTION: Machine configuration for Freescale i.MX6Q SABRE SD

include conf/machine/include/imx-base.inc
include conf/machine/include/tune-cortexa9.inc

SOC_FAMILY = "mx6:mx6q"

KERNEL_DEVICETREE = "${S}/arch/arm/boot/dts/imx6q-sabresd.dts"

UBOOT_MACHINE = "mx6qsabresd_config"

SERIAL_CONSOLE = "115200 ttymxc0"

MACHINE_FEATURES += " pci wifi bluetooth"
~~~~

[`conf/machine/include/imx-base.inc`]


Important variables:

* `IMAGE_FSTYPES`: Located on [`imx-base.inc`]((http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/conf/machine/include/imx-base.inc)). Defines the type of outputs for the Root Filesystem. Default is: `"tar.bz2 ext3 sdcard"`
* `UBOOT_ENTRYPOINT_*`: Located on [`imx-base.inc`]((http://git.yoctoproject.org/cgit/cgit.cgi/meta-fsl-arm/tree/conf/machine/include/imx-base.inc)). Defines where the Kernel is loaded by U-boot
* `SOC_FAMILY`: Defines machine's family. Only recipes with the same `SOC_FAMILY` (defined with the
recipe's variable `COMPATIBLE_MACHINE`) are taken into account when baking for a particular machine.
* `UBOOT_MACHINE`: Define the u-boot configuration file
