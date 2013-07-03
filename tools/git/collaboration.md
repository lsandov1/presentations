# Collaborating with patches

* Developer: Responsible to fix or add features

~~~~ {.bash}
MAINSTREAM_REPO=    # Place any repo you have access, e.g.
                    # https://github.com/Freescale/fsl-community-bsp-platform
MANTAINER_EMAIL=    # email of the maintainer or distribution list where developers
                    # can see your patch to be reviewed
~~~~


~~~~ {.bash}
$ git clone $MAINSTREAM_REPO    # 'clone' only the first time
                                # 'pull' otherwise, so you can have the latest
                                # commits on your local master branch
$ git branch myfix    # create a branch, where your fix's commits will be created
                      # Do not work on master, because master should just have
                      # the latest from mainstream repo origin/master  
$ git checkout myfix  # move to your new branch
# Use your favorite editor to modify any file you want
$ git add <modified file 1> <modified file 2> ....
$ git commit -m 'Title of your commit'
$ git format-patch -s --subject-prefix='PATCH' -1   # in case you have more than
                                                    # commit on this branch, use
                                                    # -N where N is the number of
                                                    # commits
$ git send-email --to $MANTAINER_EMAIL <generated patch>
$ git checkout master
# once your patches have been acknowledge/accepted, you can remove your branch
# with 'git branch -D myfix'
~~~~

* Mantainer: Responsible to mantain the main repo (mainstream repo) which one
of its main tasks is to apply patches comming from developers

~~~~ {.bash}
$ PATCH_NAME= # Place the patch's filename here
~~~~

~~~~ {.bash}
# Get the patch from your email client and place it on the local repo folder
$ git checkout development # The maintainer should have a branch where all patches
                           # will go first, then at some point this branch should
                           # be merged with master. If branch has not been created
                           # do a git checkout -b development (which is an alias
                           # for 'git branch development && git checkout development'
# Before patching, you can check what the patch does and if it can be patched smoothly
# 'git apply --stat $PATCH_NAME'
# 'git apply --check $PATCH_NAME'
$ git am --signoff < $PATCH_NAME # In case you dont want to create a commit
                                 # type 'git apply <generate patch>' 
$ git show
~~~~

# End

[Back to Menu](./menu.html#(2))
