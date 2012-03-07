% Bash: Standard Output
% Leonardo Sandoval
% 2012-03

# Preserve Spacing

~~~~ {.bash}
$ echo please            wait
please wait
$ echo "please            wait"
please            wait
~~~~

# printf

~~~~ {.bash}
$ printf '%s = %d\n' lines $LINES
lines = 52
~~~~


# Saving output


~~~~ {.bash}
$ echo a sample text > sample_file.txt

$ cat first.half second.half > whole.file

$ ls > files.txt

~~~~

# Output and Error Messages to different files

~~~~ {.bash}
$ myprogram 1>messages.out 2>message.err
~~~~

# Output and Error Messages to the same file

~~~~ {.bash}
$ both >& outfile
$ both > outfile 2>&1
~~~~

# Appending the output: >>

~~~~ {.bash}
$ ls > sample
$ cd ..
$ ls bash/ >> bash/sample
~~~~

# head and tail

~~~~ {.bash}
$ sudo dmesg | head

$ tail -2 sample 
line 4
line 5

$ tail +2 sample 
line 2
line 3
line 4
line 5
~~~~

# Throwing output

~~~~ {.bash}
$ noisy > /dev/null 2>&1
$ find / -name myname > /dev/null 2>&1
~~~~

# Saving output from several commands

~~~~ {.bash}
$ { echo 'Location:'; pwd; echo; echo 'Files:'; echo; ls; } > sample

$ (echo 'Location:'; pwd; echo; echo 'Files:'; echo; ls) > sample
~~~~

# Output as arguments

~~~~ {.bash}
$ find . -name '*.c' | rm     # incorrect: does not work

$ rm $(find . -name '*.class')  # correct
~~~~

# Looking and saving output

~~~~ {.bash}
$ ls -la | tee sample

$ gcc bad.c 2>&1 | tee save.it
~~~~

# Keeping files save

~~~~ {.bash}

$ set +o noclobber

$ echo hola > sample

$ set -o noclobber

$ echo hola > sample
-bash: sample: cannot overwrite existing file

$ echo hola >| sample
~~~~

