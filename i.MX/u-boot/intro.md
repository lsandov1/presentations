# A (fast) U-boot introduction on i.MX6 boards

The purpose of this document is to help users navigate through the U-boot code used to boot i.MX6 devices.

# Repositories

* Mainline: You can get the last features implemented 

~~~~
git://git.denx.de/u-boot.git
~~~~

* Latest code maintained by Freescale (Used on Yocto Project Alpha Releases)

~~~~
git://git.freescale.com/imx/uboot-imx.git
~~~~

* Latest code maintaned by the Yocto Project Community 

~~~~
$ git://github.com/Freescale/u-boot-imx.git
~~~~

* Code used by LTIB (based on 2009.08 and patched with LTIB)

~~~~{.bash}
$ ./ltib -m prep - p u-boot
$ cd ltib/rpm/u-boot-*
~~~~

# Compilation

* As in Kernel, U-boot uses 'Makefile' rules to compile and generate the final binary file: `u-boot.imx`. 'Makefile'
needs as input the architecture (`ARCH`) and toolchain path (`CROSS_COMPILE`). For the case of i.MX


~~~~{.bash}
$ export ARCH=arm
$ export CROSS_COMPILE=/opt/freescale/usr/local/\
                        gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12/\
                        fsl-linaro-toolchain/bin/arm-none-linux-gnueabi- 
~~~~

* Clean previous built

~~~~{.bash}
$ make distclean
~~~~

* Select your configuration. 

~~~~{.bash}
$ make mx6q_sabresd_config
~~~~

If you do not know the real name, you can find all possible i.MX boards with

~~~~{.bash}
$ find include/configs/ | grep mx6
~~~~

* Compile

~~~~{.bash}
$ make
~~~~

* Recent U-boot versions (2013), the binary to be flashed is `u-boot.imx`. This file has NO
padding, so `skip=2` is not necessary (it was necessary on 2009 versions)

~~~~{.bash}
$ sudo dd if=u-boot.imx of=/dev/sdX bs=512 seek=2; sync
~~~~

Make sure you execute the last `sync` command, so OS buffers are flushed into the SD card. This command copies 
the u-boot image at the address 0x400, as required by the processor.

* Boot

Now remove your card from the PC and go to the target. The u-boot prompt should come after power on.

# Execution Path: From reset to U-boot

1. The boot ROM uses the state of the BOOT_MODE register and eFUSEs to determine the boot device
1. The i.MX6 Series boot ROM supports booting from NOR, NAND, SD/MMC, SATA devices
1. ROM loads the initial bootloader data from the boot device into internal memory
1. Refer to System Boot chapter of reference manual
1. One of the first things a bootloader must do is to enable the memory subsystem, 
   very little can happen until the DRAM controller has been properly initialized. After memory 
   initialization the bootloader is copied into DRAM

# U-boot's Execution Path

* U-boot's entry file can be found on the `u-boot.lds`, on the `.text` section. For 2013.04 branch, the section is


~~~~
SECTIONS
{
 . = 0x00000000;
 . = ALIGN(4);
 .text :
 {
  __image_copy_start = .;
  arch/arm/cpu/armv7/start.o (.text*)
  *(.text*)
 }
~~~~

The entry point on `arch/arm/cpu/armv7/start.S` is `_start`. The execution path starts on `_start` and finishes on
`boot_jump_linux` on `arch/arm/lib/bootm.c`. The path is complex but some important entry points are shown below:

1. `arch/arm/cpu/armv7/start.S: _start`
    + Entry Point, as seen on `u-boot.lds`
    + The entry point file can be easily found on the `u-boot.lds` linker script

1. `arch/arm/cpu/armv7/start.S: reset`

1. `arch/arm/lib/crt0.S: _main`
    + Handles target-independent stages of the U-boot start-up
    + Set up initial enviroment for calling board_init_f()
    + Provides stack and and a place to store the GD ('global data') structure

1. `arch/arm/lib/board.c: board_init_f`
    + The string '_f' at the end of function name implies that code is being is 
    executed from Flash (or any storage media, i.e. SD Card)
    + Prepares the hardware for the execution from system's RAM (DRAM, DDR)
    + It uses GD to store any data which is used on later stages: relocation
    destination, the future stack and the future GD location
    + Check `include/asm-generic/global_data.h` for `typedec struct global_data { } gd_t;`
    + More detail on next section

1. `arch/arm/lib/board.c: board_init_r`
    + The string '_r' at the end of function name implies that code is being executed from
    RAM
    + Running on RAM and a "normal" environment: Global data, stack size is not critical, etc.
    + Enable Caches, chip Selection, console initialization

1. `arch/arm/lib/bootm.c: do_bootm_linux`
    + Entry point for ARM `bootm` implementation

1. `arch/arm/lib/bootm.c: boot_jump_linux`
    + Jump to Kernel entry point


# Initialization function: `board_init_f`

* Important entry points:

1. `arch/arm/cpu/armv7/mx6/soc.c: arch_cpu_init`
    + Sets VDDSOC to 1.2V
    + Power down wdog, PCIE and VDDPU
1. `board/freescale/mx6qsabresd/mx6qsabresd.c: board_early_init_f`
    + Setp UART, SPINOR and SATA
1. `arch/arm/lib/board.c: init_baudrate`
    + Sets the baudrate (115200)
1. `drivers/serial/serial.c: serial_init`
1. `common/console.c: console_init_f`
1. `arch/arm/imx-common/cpu.c: print_cpuinfo`
1. `arch/arm/lib/board.c: init_func_i2c`
1. `board/freescale/mx6qsabresd/mx6qsabresd.c: dram_init`
    + Sets the RAM's size

* The Global Data structure (defined on `include/asm-generic/global_data`) is filled 
during `board_init_f` execution. This information is used along the execution path.

* At the end of the function, the function copies U-boot into RAM, and execution is now on RAM.


# Memory map: `u-boot.map`

The file called `u-boot.map` located on the root folder, is generated when compiling U-boot. 
This file contains a memory map of 'start address' versus 'function name'. In case you are looking for
some code, this would be the first file to start your search.
