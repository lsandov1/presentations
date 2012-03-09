# PATH 

~~~~ {.bash}
$ bash
$ touch ls
$ chmod 755 ls
$ PATH=".:$PATH"
$ ls
~~~~

# Succees or not: $?  
~~~~ {.bash}
$ git commiT
fatal: cannot handle commiT internally

$ echo $?
128

$ git status
# On branch master
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#
# .
# .

$ echo $?
0
~~~~


# Several commands in a sequence

~~~~ {.bash}
$ cat > script
long
medium
short
^D

$ bash ./script 

$ long; medium; short

$ long && medium && short
~~~~

# Several commands at once
~~~~ {.bash}
$ long &
[1] 65072

$ medium &
[2] 65073

$ short &
[3] 65074

$ long & medium & short
[1] 65072
[2] 65073

$ fg %1

$ kill %1

$ kill 65072
~~~~

# Execute a command if the last succeed

~~~~ {.bash}
$ cd mytmp
$ if (( $? == 0 )); then rm * ; fi

$ cd mytmp && rm  *

$ set -e # will cause the shell to exit when a command fails
$ cd mytmp
~~~~

# Running jobs unattended: nohup

~~~~ {.bash}
$ nohup long &
[1] 65298
appending output to nohup.out
~~~~

# Displaying error messages: ||

~~~~ {.bash}
$ cmd || { printf "%b" "Something FAILED.\n"; exit 1; }
~~~~

# Running scripts

* Inside a script

~~~~ {.bash}
for SCRIPT in /path/to/scripts/dir/*
do
  if [ -f $SCRIPT -a -x $SCRIPT ]
  then
    $SCRIPT
  fi
done
~~~~

* On the command line

~~~~ {.bash}
$ for SCRIPT in ./scripts/*; do if [ -f $SCRIPT -a -x $SCRIPT ]; then $SCRIPT; fi; done
~~~~


[Back to Menu](./menu.html#(2))