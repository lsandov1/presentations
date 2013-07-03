% Bash: Tools
% Leonardo Sandoval
% 2012-03


# Diff: between files

Check difference between files/folders

~~~~
$ cat original.c
#include <stdio.h>

int main(void) {

  printf("Hello World\n");
  exit(0);

}
~~~~

~~~~
$ cat modified.c 
#include <stdio.h>

int main(int argc, char *argv[]) {

  printf("Hello World\n");

}
// End of the main function
~~~~

~~~~
$ diff original.c modified.c
3c3
< int main(void) {
---
> int main(int argc, char *argv[]) {
6d5
<   exit(0);
8a8
> // End of the main function
~~~~~


* `diff -u`: Unified Context

~~~~{.bash}
$ diff -u original.c modified.c 
--- original.c	2013-07-03 11:12:52.727219531 -0500
+++ modified.c	2013-07-03 11:14:11.271216136 -0500
@@ -1,8 +1,8 @@
 #include <stdio.h>
 
-int main(void) {
+int main(int argc, char *argv[]) {
 
   printf("Hello World\n");
-  exit(0);
 
 }
+// End of the main function
~~~~


# Diff: between folders

* `diff -Naur <original folder> <modified folder>`

~~~~{.bash}
$ mkdir original modified
$ cp original.c original/original.c
$ cp modified.c modified/original.c
$ diff -Naur original modified
diff -Naur original/original.c modified/original.c
--- original/original.c	2013-07-03 11:31:53.095170213 -0500
+++ modified/original.c	2013-07-03 11:32:08.279169574 -0500
@@ -1,8 +1,8 @@
 #include <stdio.h>
 
-int main(void) {
+int main(int argc, char *argv[]) {
 
   printf("Hello World\n");
-  exit(0);
 
 }
+// End of the main function
~~~~

Parameters:

* `N`: In case a file is missing on any of the folders, treat it as empty
* `a`: Treat everything as text
* `u`: Unified Context (human friendly diff)
* `r`: Diff recursively


# Patch

~~~~{.bash}
# Create a new folder and copy the original folder
$ mkdir tmp && cd tmp
$ cp -a ../original .
~~~~

~~~~{.bash}
# Before patching, check if patch's file can be apply.
$ patch --dry-run < ../main.patch 
patching file original.c
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- saving rejects to file original.c.rej
~~~~

Make sure you select the correct `-p` parameter: `-pN` indicates to ignore the first
`N` folders

~~~~{.bash}
$ patch --dry-run -p0 < ../main.patch 
patching file original/original.c
~~~~

~~~~{.bash}
$ patch -p0 < ../main.patch 
patching file original/original.c
~~~~

~~~~{.bash}
$ diff original/ ../modified
$
~~~~

# Filtering: grep

~~~~ {.bash}
$ grep printf *.c # simple search

$ grep -l printf *.c # list just the files
  main.c
  lib1.c
  lib2.c

$ grep -i printF *.c # ignore case

$ ruby somescript 2>&1 | grep -i error # filtering

$ grep -i dec logfile | grep -vi decimal # double filtering

$ egrep '[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}' filename # match a valid IP

$ egrep -i '^(linux|unix)' filename
~~~~


# Parsing: awk

~~~~ {.bash}
$ awk '{print $1}' myinput.file

$ cat myinput.file | awk '{print $1}'

$ ls -l | grep -v '^total' | awk '{sum += $5} END {print sum}' # print the folder size, in bytes
~~~~


# Sorting

~~~~ {.bash}
$ sort file1 file2 filen > sorted

$ sort -r file1 file2 filen > rsorted

$ sort -n numbers
2
33
4398

$ somesequence | sort -u # remove duplicates
~~~~

# Compressing / Uncompressing

~~~~ {.bash}
$ tar czf tarball_name.tgz directory_of_files # Compress
$ tar tzf tarball_name.tgz # List contents
$ tar xzf tarball_name.tgz # Uncompress

$ zip -r zipfile_name directory_of_files
$ unzip zipfile_name
~~~~

# Replacing chars

~~~~ {.bash}
$ tr ';' ',' <be.fore >af.ter

$ tr 'A-Z' 'a-z' <upper.case >lower.case

$ tr -d '\r' <file.dos >file.txt # remove the carriage return '\r' in DOS files
~~~~

# Counting: wc

~~~~ {.bash}
$ wc data_file
2       6      27 sample.txt

$ wc -l sample.txt 
2 sample.txt

$ lines=$(wc -l sample.txt | awk '{print $1}')
~~~~

# Doing more with less: less

* All derived UNIX flavors have it!

~~~~ {.bash}
$ export LESS="--LONG-PROMPT --LINE-NUMBERS --ignore-case --QUIET"
$ cat longfile | less
~~~~

# Finding files: find

* General search

~~~~ {.bash}
$ find /usr/bin -name '*.sh'
~~~~

* Do something with matched files

~~~~ {.bash}
$ find . -name '*.sh' -print -exec chmod +x '{}' \;

$ find . -iname '*.PNG' -print -exec mv '{}' ~/images \;
~~~~

* Using dates 

~~~~ {.bash}
$ find ~ -name '*.*' -mtime -1 -print # look for files modified since yesterday

$ find . -name '*.jpg' -mtime +90 -print # look for files modified more than 90 days ago
~~~~

* Types

~~~~ {.bash}
$ find . -type d -name '*java*' -print  #match  folders with java as substrings 

$ find . -type l -name '*' -print   # match symbolic links
~~~~

* Size

~~~~ {.bash}
$ find . -size +10000k -print # search files greater than 10MB

$ find . -size 0 -print -exec rm '{}' \; # remove empty files
~~~~

* Content

~~~~ {.bash}
$ find . -name '*.rb' -exec grep 'nokogiri' '{}' \;
~~~~

* locale

~~~~ {.bash}
locate myfile
~~~~

# Reusing

~~~~ {.bash}
$ cat > config
TMP=/tmp
NAME=ooyala   
^D

$ cat > script
#!/bin/bash
source ./config
echo $TMP
echo $NAME
^D

$ chmod +x script 

$ ./script 
/tmp
ooyala
$ 
~~~~

# Defining Functions

~~~~ {.bash}
#!/bin/bash

function usage ()
{
  printf "usage: %s file1 ... filen\n" $0 >&2
}

if [ $# -lt 1 ]
then
  usage
fi
~~~~

# Function arguments

~~~~ {.bash}
#!/bin/bash
function max ()
{
  if [ $1 -gt $2 ]
  then
    echo $1
  else
    echo $2
  fi
}
max $1 $2
~~~~

~~~~ {.bash}
./max 10 5
10
~~~~

# Alias

~~~~ {.bash}
$ alias ls='ls -a'

$ alias h='ls $HOME'

$ unalias ls

$ alias # List all alias
~~~~


[Back to Menu](./menu.html#(2))
