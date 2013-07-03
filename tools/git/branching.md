# Git Branching

![](http://git-scm.com/figures/18333fig0302-tn.png)

# Master

![](http://git-scm.com/figures/18333fig0303-tn.png)

# Creating a branch

~~~~ {.bash}
$ git branch testing
~~~~

![](http://git-scm.com/figures/18333fig0304-tn.png)

# HEAD pointer

![](http://git-scm.com/figures/18333fig0305-tn.png)


~~~~ {.bash}
$ git checkout testing
~~~~

![](http://git-scm.com/figures/18333fig0306-tn.png)

# HEAD pointer (cont)

~~~~ {.bash}
$ vim test.rb
$ git commit -a -m 'made a change'
~~~~

![](http://git-scm.com/figures/18333fig0307-tn.png)

~~~~ {.bash}
$ git checkout master
~~~~

![](http://git-scm.com/figures/18333fig0308-tn.png)


~~~~ {.bash}
$ vim test.rb
$ git commit -a -m 'made another change'
~~~~

![](http://git-scm.com/figures/18333fig0309-tn.png)


# Merging: Fast-Forward

![](http://git-scm.com/figures/18333fig0313-tn.png)


~~~~ {.bash}
$ git checkout master
$ git merge hotfix
Updating f42c576..3a0874c
Fast forward
 README |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)
~~~~

![](http://git-scm.com/figures/18333fig0314-tn.png)

~~~~ {.bash}
$ git branch -d hotfix
Deleted branch hotfix (3a0874c).
~~~~


# Merging: Recursive


![](http://git-scm.com/figures/18333fig0316-tn.png)

~~~~ {.bash}
$ git checkout master
$ git merge iss53
Merge made by recursive.
 README |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)
~~~~


![](http://git-scm.com/figures/18333fig0317-tn.png)

~~~~ {.bash}
$ git branch -d iss53
~~~~

# End

[Back to Menu](./menu.html#(2))
