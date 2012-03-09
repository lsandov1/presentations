% Bash: Tools I
% Leonardo Sandoval
% 2012-03

# Grepping

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


# Awking

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

