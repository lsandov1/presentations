# Pro Git

* Most commands taken from [git-scm](http://git-scm.com/book)

![](http://git-scm.com/images/books/pro-git@2x.jpg)


# Version Controller System (VCS)

* Local VCS

![](http://git-scm.com/figures/18333fig0101-tn.png "Local VCS")

* Central VCS

![](http://git-scm.com/figures/18333fig0102-tn.png "Central VCS")

* Distributed VCS

![](http://git-scm.com/figures/18333fig0103-tn.png "Distributed VCS")

# Set up Git

~~~~ {.bash}
$ git config --global user.name "Your Name Here"
# Sets the default name for git to use when you commit
~~~~

~~~~ {.bash}
git config --global user.email "your_email@example.com"
# Sets the default email for git to use when you commit
~~~~

~~~~ {.bash}
git config --global core.editor vim
# Sets the default editor for git to use when you commit
~~~~

~~~~ {.bash}
git config --global sendemail.smtpserver remotesmtp.freescale.net
# Sets the default SMTP server for git to use when you send your git patch
~~~~


# Creating a Repo on GitHub

![](https://a248.e.akamai.net/assets.github.com/images/modules/logos_page/GitHub-Logo.png)


* Create an account on [github](https://github.com/)
* Create a Repo with the name of your project
* Generate SSH [Keys](https://help.github.com/articles/generating-ssh-keys)
* Set `bash` enviroment variables

~~~~ {.bash}
PROJECT_NAME=
GITHUB_USERNAME=
~~~~ 

* Version your project

~~~~ {.bash}
$ cd myproject
$ git init
$ touch README
$ git add README
# Add any other files you want
$ git commit -m 'Initial Project Version'
~~~~

* Push your commits in GitHub

~~~~ {.bash}
$ git remote add origin https://github.com/$USERNAME/$PROJECT_NAME.git
# Creates a remote named "origin" pointing at your GitHub repository

$ git push origin master
# Sends your commits in the "master" branch to GitHub
~~~~


# Recording Changes to Repository

![](http://git-scm.com/figures/18333fig0201-tn.png "File Status Lifecycle")

~~~~ {.bash}
$ cat > Makefile
Makefile
# SOURCES=helloworld.c
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
$ git add helloword.c include
$ git status
$ git commit -m 'helloword: First application'
~~~~

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
$ git add forgotten_file
$ git commit --amend
~~~~

* Unstaging a Staged File

~~~~ {.bash}
$ echo "# hello #' > README
$ git add README
$ git status
$ git reset HEAD README
~~~~

* Unmodifying a Modified File

~~~~ {.bash}
$ echo "# hello #' > README
$ git status
$ git checkout -- README
~~~~

# Collaborating with Remotes

* User 1

~~~~ {.bash}
# Add some text on the README file and commit your change
$ git push origin master
~~~~

* User 2

~~~~ {.bash}
$ GITHUB_USERNAME_1=
$ git remote
$ git remote -v
$ git remote add $GITHUB_USERNAME_1 git://github.com/$GITHUB_USERNAME_1/$PROJECT_NAME.git
$ git remote -v
$ git fetch $GITHUB_USERNAME_1
$ git merge $GITHUB_USERNAME_1/master
~~~~

# Collaborating with patches

* User 1

~~~~ {.bash}
# Change something on helloworld.c and commit your change
$ git format-patch -s --subject-prefix='PATCH'
$ git send-email --to user2@email.com <generated patch>
~~~~

* User 2

~~~~ {.bash}
# Download patch
$ git apply --stat <generated patch>
$ git apply --check <generated patch>
$ git am --signoff < <generated patch>
$ git log -p -1
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
$ git tag v1.0-lw
$ git tag
$ git show v1.0-lw
~~~~

* Tagging older commits

~~~~ {.bash}
$ git log --pretty=oneline
$ git tag -a v0.1 -m 'my 0.1 alpha version' <place the commit ID you want to tag>
$ git show v0.1
~~~~

* Sharing tags

~~~~ {.bash}
git push origin v1.0
~~~~

~~~~ {.bash}
git push origin --tags
~~~~


# Tips and tricks


