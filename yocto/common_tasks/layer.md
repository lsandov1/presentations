# Creating a new (Board Specific Package) Layer

You **do not** need to create a new layer if

* Your board is a Freescale's ARM based platform. For this case, add your content
directly into the Board Specific Package layer called `meta-fsl-arm-extra`. 

* it is already implemented. To check this, see the list of available [layers](http://layers.openembedded.org/layerindex/layers/). If found, download the layer and add it to the `conf/bblayers.conf` file


You need to create a new layer when creating or modifying new package(s). There are many 
reasons to create a layer, the most important is that your work will not pollute any other
layer, so if issues are presented during the development process, it is likely that you
have introduced these in your custom layer.


1. Setup the Yocto environment

~~~~{.bash}
$ . setup-environment build
~~~~

2. Under the `sources` folder, execute the `yocto-layer`, choose any name you want 
(e.g. `fsl-custom`)


~~~~{.bash}
sources $ yocto-layer create fsl-custom
Please enter the layer priority you'd like to use for the layer: [default: 6] 
Would you like to have an example recipe created? (y/n) [default: n] 
Would you like to have an example bbappend file created? (y/n) [default: n] 

New layer created in meta-fsl-custom.
~~~~

3. Add any content you want (images, recipes, appends, classes, etc.)

4. Finally, add the layer to the `build/conf/bblayers.conf` file

5. To verify that your layer is *seen* by BitBake, run the following command

~~~~{.bash}
$ bitbake-layers show-layers
~~~~

6. If your layer is not shown, make sure you have added the correct layer's path
into the `bblayers.conf` file
