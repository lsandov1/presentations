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
