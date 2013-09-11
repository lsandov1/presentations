# Pro Git

* Examples taken from [git-scm](http://git-scm.com/book)

![](http://git-scm.com/images/books/pro-git@2x.jpg)


# Version Controller System (VCS)

* Local VCS

![](http://git-scm.com/figures/18333fig0101-tn.png "Local VCS")

* Central VCS

![](http://git-scm.com/figures/18333fig0102-tn.png "Central VCS")

* Distributed VCS

![](http://git-scm.com/figures/18333fig0103-tn.png "Distributed VCS")

# Install Git

[Download](http://git-scm.com/) and install it

# Set up Git

~~~~ {.bash}
$ git --version
~~~~

~~~~ {.bash}
$ git config --global user.name "Your Name Here"
# Sets the default name for git to use when you commit
~~~~

~~~~ {.bash}
$ git config --global user.email "your_email@example.com"
# Sets the default email for git to use when you commit
~~~~

~~~~ {.bash}
$ git config --global core.editor vim
# Sets the default editor for git to use when you commit
~~~~

~~~~ {.bash}
$ git config --global sendemail.smtpserver remotesmtp.freescale.net
# Sets the default SMTP server for git to use when you send your git patch
~~~~

~~~~ {.bash}
$ cat ~/.gitconfig
# You can also manually edit this file
~~~~


# Version your project

~~~~ {.bash}
$ PN=demo # Project Name: demo
~~~~ 

~~~~ {.bash}
$ mkdir $PN && cd $PN
$ git init
$ touch README
$ git add README
$ git commit -m 'Initial Project Version'
$ git log
~~~~


# Recording Changes to Repository

![](http://git-scm.com/figures/18333fig0201-tn.png "File Status Lifecycle")

~~~~ {.bash}
$ cat > Makefile
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=helloworld
all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS) 
        $(CC) $(LDFLAGS) $(OBJECTS) -o $@

.c.o:
        $(CC) $(CFLAGS) $< -o $@
^d

$ cat > helloworld.c
#include <stdio.h>
#include <hello.h>

int main(void)
{
    hello();
    return 0;
}
^d

$ mkdir include
$ cat > include/helloworld.h
#ifndef __HELLO_H__
#define __HELLO_H__
#define hello() printf("Hello World\n");
#endif // __HELLO_H__
^d

$ git status
$ git add helloworld.c include
$ git status
$ git commit 
# 
~~~~

![](http://wiki.openstack.org/wiki/GitCommitMessages)


# Commit history

~~~~ {.bash}
$ git log
$ git log -p
$ git log -p -2
$ git log --stat
$ git log --pretty=oneline
$ gitk
~~~~

# Undoing Things

![](http://git-scm.com/figures/18333fig0201-tn.png "File Status Lifecycle")

* Changing last commit

~~~~ {.bash}
$ git add Makefile
$ git commit --amend
$ git log -p -1
~~~~

* Unstaging a Staged File (Staged to Modified)

~~~~ {.bash}
$ echo '# hello #' > README
$ git add README
$ git status
$ git reset HEAD README
~~~~

* Unmodifying a Modified File (Mofified to Unmodified)

~~~~ {.bash}
$ git status
$ git checkout -- README
$ git status
~~~~

# Pushing stuff to your remote repo


* Create an account on [github](https://github.com/)
* Create a New Repository with the name of your project ($PN)

~~~~ {.bash}
$ GHUN=b42214 # GitHub UserName you have used
~~~~


~~~~ {.bash}
$ git remote add origin https://github.com/$GHUN/$PN.git
# Creates a remote named "origin" pointing at your GitHub repository

$ git remote -v

$ git push origin master
# Sends your commits in the "master" branch to GitHub
# Verify your commits are now in GitHub visiting the repo's page
~~~~


# End

[Back to Menu](./menu.html#(2))






