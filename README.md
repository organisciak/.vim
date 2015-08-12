VIM Dotfiles
============

This repo keeps my recommended vim settings and plugins.

Installation
------------

Clone Repo

```
cd ~/
git clone https://github.com/organisciak/.vim.git
```

Vim settings are kept in ~/.vimrc. To keep everything in the repo, add a symlink to the repo's version of vimrc. This will replace your copy. If you don't want to do so, at the very least have the vimrc lines necessary for Pathogen (https://github.com/tpope/vim-pathogen).

```
ln -s ~/.vim/vimrc ~/.vimrc
```

Finally, install dependencies and initialize the submodules.

```
cd .vim
make extras
git submodule init
git submodule update
```

Adding Plugins
---------------

e.g.
```
git submodule add https://github.com/kien/ctrlp.vim.git bundle/ctrp.vim
```

Updating Plugins
----------------

```
git submodule foreach git pull origin master
```

Grammar Checker
----------------

To install the LanguageTool Grammar Checker, download the standalone archive from https://www.languagetool.org and unzip it to ~/.vim/LanguageTool

Troubleshooting
---------------

As per http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/, if git status reports a dirty submodule tree, add ignore = dirty to that submodule's gitignore.
