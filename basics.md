% Bash: Basics
% Leonardo Sandoval
% 2012-03


# History

* C Shell (quirky)
* Korn Shell (was not open source at the beginning)
* Bash took Korn and C Shell features
* Default user shell on every Linux and Mac OS boxes

# What is Bash

* Bash is a shell: a command interpreter
* Shell programming, or shell scripting allows to AUTOMATE tasks

# Where am I: pwd

~~~~ {.bash}
$ pwd
/Users/leonardo/tmp

$ export PS1='[\u@\h \w]$ '

[leonardo@leonardo-macbookpro ~/tmp]$ pwd -P
/Users/leonardo/tmp


$ export PS1='$ '
~~~~

# Findind and Running Commands: type, apropos, locate

~~~~ {.bash}
$ type which
which is hashed (/usr/bin/which)

$ apropos bash
bash(1)                  - GNU Bourne-Again SHell
bashbug(1)               - report a bug in bash

$ locate apropos
/Developer/Library/PrivateFrameworks/DocSetViewing.framework/Versions/A/Resources/apropos.pl
/usr/bin/apropos
/usr/share/emacs/22.1/lisp/apropos.el.gz
/usr/share/emacs/22.1/lisp/apropos.elc
/usr/share/man/man1/apropos.1.gz
~~~~

# Getting Information about Files: ls, stat, file

~~~~ {.bash}
$ touch sample_file

$ ls sample_file
  sample_file

$ ls -l sample_file
-rw-r--r--  1 leonardo  staff  0 Mar  7 13:30 sample_file

$ stat -x sample_file 
  File: "sample_file"
  Size: 0            FileType: Regular File
  Mode: (0644/-rw-r--r--)         Uid: ( 2154/leonardo)  Gid: (   20/   staff)
  Device: 14,5   Inode: 4429937    Links: 1


$ file sample_file 
sample_file: empty

$ echo '#!/bin/bash -' > sample_file

$ file sample_file 
sample_file: Bourne-Again shell script text executable
~~~~

# Showing hidden files in current folder

~~~~ {.bash}
ls -d .*
~~~~

# Using Shell Quoting

~~~~ {.bash}
$ echo "$5?!"
-bash: !": event not found

$ echo '$5?!'

$ echo 'your name is ' "$USER"'!'
your name is  leonardo!

~~~~
