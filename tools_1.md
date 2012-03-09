% Bash: Tools
% Leonardo Sandoval
% 2012-03

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

