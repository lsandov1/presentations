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
$ echo '{{ Hello }}' >> README
$ git commit -a -m 'New line on README' # -a indicates to add all modified files!
$ git tag v1.1-lw
$ git tag
$ git show v1.1-lw
~~~~

* Tagging older commits

~~~~ {.bash}
$ git log --pretty=oneline
$ git tag -a v0.1 -m 'my 0.1 alpha version' <place the commit ID you want to tag>
$ git show v0.1
~~~~

* Sharing tags

~~~~ {.bash}
$ git push origin v1.0
~~~~

~~~~ {.bash}
$ git push origin --tags
~~~~

# End

[Back to Menu](./menu.html#(2))
