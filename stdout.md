# Preserve Spacing

~~~~ {.bash}
$ echo please            wait
please wait
$ echo "please            wait"
please            wait
~~~~

# printf

~~~~ {.bash}
$ LINES=52
$ printf '%s = %d\n' lines $LINES
lines = 52
~~~~


# Saving output


~~~~ {.bash}
$ echo a sample text > sample_file.txt

$ cat first.half second.half > whole.file

$ ls > files.txt
~~~~

# Output and Error Messages

* To different files

~~~~ {.bash}
$ myprogram 1>messages.out 2>message.err
~~~~


* To the same file

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
$ noisy 2>&1 /dev/null
$ find / -name myname >& /dev/null
~~~~

# Saving output from several commands

~~~~ {.bash}
$ { echo 'Location:'; pwd; echo; echo 'Files:'; echo; ls; } > sample

$ (echo 'Location:'; pwd; echo; echo 'Files:'; echo; ls) > sample
~~~~

# Output as arguments

~~~~ {.bash}
$ rm $(find . -name '*.class')
~~~~

# Looking and saving output

~~~~ {.bash}
$ ls -la | tee sample

$ gcc bad.c 2>&1 | tee save.it
~~~~


[Back to Menu](./menu.html#(2))