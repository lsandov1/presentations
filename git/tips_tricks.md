# Tips and tricks

* Autocompletion

~~~~ {.bash}
$ curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash > ~/git-completion.bash
$ source ~/git-completion.bash
$ git che<TAB>
checkout      cherry        cherry-pick   
~~~~~


* Alias

~~~~ {.bash}
$ git config --global alias.unstage 'reset HEAD --'
$ git unstage README # instead of 'git reset HEAD REAME'
~~~~

~~~~ {.bash}
$ git config --global alias.co checkout
$ git config --global alias.br branch
$ git config --global alias.ci commit
$ git config --global alias.st status
~~~~

~~~~ {.bash}
$ git config --global alias.last 'log -1 HEAD'
$ git last
~~~~

# End

[Back to Menu](./menu.html#(2))
