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

[Download it](http://git-scm.com/)

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


# GitHub

* Create an account on [github](https://github.com/)
* Create a New Repository with the name of your project (*demo*)
* Set `bash` enviroment variables

~~~~ {.bash}
$ PN=demo     # Project Name: demo
$ GHUN=b42214 # GitHub UserName: Your Core ID, or any ID you want to use on GitHub
~~~~ 

* Version your project

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

![](https://wiki.openstack.org/wiki/GitCommitMessages)


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

~~~~ {.bash}
$ git remote add origin https://github.com/$GHUN/$PN.git
# Creates a remote named "origin" pointing at your GitHub repository

$ git remote -v

$ git push origin master
# Sends your commits in the "master" branch to GitHub
~~~~


# Collaborating with Remotes

* Developer

~~~~ {.bash}
# Add some text on the README file and commit your change
$ git push origin master
~~~~

* Mantainer

~~~~ {.bash}
$ PN=demo
$ GHDEVELOPER= # Set Github ID of Developer
$ git remote -v
$ git remote add $GHDEVELOPER https://github.com/$GHDEVELOPER/$PN.git
$ git remote -v
$ git fetch $GHDEVELOPER
$ git branch # Check current branch
$ git merge $GHDEVELOPER/master
$ # The file(s) changed by User 1 should be present now
$ git show HEAD # or simply 'git show'
~~~~

# Collaborating with patches

* Developer

~~~~ {.bash}
$ MANTAINER_EMAIL=maintainer@email.com
# Change something on helloworld.c and commit your change
$ git format-patch -s --subject-prefix='PATCH' -1
$ git send-email --to $MANTAINER_EMAIL <generated patch>
~~~~

* Mantainer

~~~~ {.bash}
# Download patch
$ git apply --stat <generated patch>
$ git apply --check <generated patch>
$ git am --signoff < <generated patch> # In case you dont want to create a commit
                                       # type 'git apply <generate patch>' 
$ git show
~~~~

# Tags

* Listing

~~~~ {.bash}
$ git tag
~~~~

* Annotated tags (heavyweight tags)

~~~~ {.bash}
$ git tag -a v1.0 -m 'my 1.0 alpha version'
$ git tag
$ git show v1.0
~~~~

* Lightweight Tags

~~~~ {.bash}
$ echo '{{ Hello }}' >> README
$ git commit -a -m 'New line on README' # -a indicates to add all modified files!
$ git tag v1.1-lw
$ git tag
$ git show v1.1-lw
~~~~

* Tagging older commits

~~~~ {.bash}
$ git log --pretty=oneline
$ git tag -a v0.1 -m 'my 0.1 alpha version' <place the commit ID you want to tag>
$ git show v0.1
~~~~

* Sharing tags

~~~~ {.bash}
$ git push origin v1.0
~~~~

~~~~ {.bash}
$ git push origin --tags
~~~~


# Tips and tricks

* Autocompletion

~~~~ {.bash}
$ curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash > ~/git-completion.bash
$ source ~/git-completion.bash
$ git che<TAB>
checkout      cherry        cherry-pick   
~~~~~


* Alias

~~~~ {.bash}
$ git config --global alias.unstage 'reset HEAD --'
$ git unstage README # instead of 'git reset HEAD REAME'
~~~~

~~~~ {.bash}
$ git config --global alias.co checkout
$ git config --global alias.br branch
$ git config --global alias.ci commit
$ git config --global alias.st status
~~~~

~~~~ {.bash}
$ git config --global alias.last 'log -1 HEAD'
$ git last
~~~~

[Back to Menu](./menu.html#(2))






