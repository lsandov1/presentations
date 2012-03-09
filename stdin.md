# Getting input from a file: <

~~~~ {.bash}
$ wc < myfile.c
~~~~

# Data inside a script

~~~~ {.bash}
$ cat email 
#!/bin/bash
#

grep $1 <<EOF
leonardo ls@ooyala.com
ivan iv@ooyala.com
moises ms@ooyala.com
EOF
 
$ ./email leonardo
leonardo ls@ooyala.com
~~~~

