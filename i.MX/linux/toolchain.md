# What is a toolchain?

* Set of binaries running on architecture A that either produce
 ([gcc](https://gcc.gnu.org/)) or understand binaries
 ([binutils](http://www.gnu.org/software/binutils/))

# How do I get them?

You can either compile them manually, semi-manually
([crosstool-ng](http://crosstool-ng.org/)) or download the 
binaries

# Linaro binaries

* Download the binaries at [linaro](http://www.linaro.org/downloads/) download
page

* Decompress and set the PATH

~~~~{.bash}
export PATH=<full path the toolchain bin directory>:$PATH
~~~~

# What Can I do with it?

* Let's compile the most famous embedded bootloader: [U-boot](./uboot.html)

[Main Menu](./menu.html#(2))
