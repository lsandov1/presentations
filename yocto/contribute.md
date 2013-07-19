# Contributing to the Freescale Yocto Project

The Yocto Project is open-source, so anyone can contribute. No matter what your contribution is 
(bug fixing or new metadata), contributions are sent 
through patches to a community list. Many eyes will look into your patch and 
at some point it is either rejected or accepted. Follow these steps to 
contribute:


1. Make sure you have previously 
    
    + configured your personal info

    ~~~~{.bash}
    $ git config --global user.name "Your Name Here"
    $ git config --global user.email "your_email@example.com"
    ~~~~

    + subscribed to the Freescale Yocto Project [Mailing List](https://lists.yoctoproject.org/listinfo/meta-freescale)

2. Download `master` branches

~~~~{.bash}
fsl-community-bsp $  repo init \
    -u https://github.com/Freescale/fsl-community-bsp-platform \
    -b master
~~~~

3. Update

~~~~{.bash}
fsl-community-bsp $ repo sync
~~~~

4. Create local branches so your work is *not* done on master

~~~~{.bash}
fsl-community-bsp $ repo start <branch name> --all
~~~~

Where `<branch name>` is any name you want to give to your local branch (e.g.
`fix_uboot_recipe`, `new_gstreamer_recipe`, etc.)

5. Make your changes in any Freescale related folder (e.g.  sources/meta-fsl-arm).
In case you modified a recipe (.bb) or include (.inc) file, do not forget to *bump* (increase the 
value by one) either the `PR` or `INC_PR` value

6. Commit your changes using `git`. In this example we assume your change is on `meta-fsl-arm` folder

~~~~{.bash}
sources/meta-fsl-arm $ git add <file 1> <file 2>
sources/meta-fsl-arm $ git commit
~~~~

On the commit's log, the title must start with the filename change or introduced, then a brief 
description of the patch's goal, following with a long description. Make sure you follow the standards 
(type ` git log --pretty=oneline` to see previous commits)

7. Create a patch

~~~~{.bash}
sources/meta-fsl-arm $ git format-patch -s \
    --subject-prefix='<meta-fsl-arm][PATCH' -1
~~~~

Where the last parameter (`-1`) indicate to patch last commit. In case you want to create patches for older commits, just indicate the correct index.
If your patch is done in other folder, just make sure you change the `--subject-prefix` value.

8. Send your patch or patches with

~~~~{.bash}
git send-email --to meta-freescale@yoctoproject.org <patch>
~~~~

where `<patch>` is the file created by `git format-patch`.

9. Keep track of patch's responses on the mailing list. In case you need to rework your patch,
repeat the steps but this time the patch's subject changes to `--subject-prefix='<meta-fsl-*][PATCH v2'` 

10. Once your patch has been approved, you can delete your working branches 

~~~~{.bash}
fsl-community-bsp $ repo abandon <branch name>
~~~~
