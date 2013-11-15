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

Vim settings are kept in ~/.vimrc. To keep everything in the repo, add a symlink to the repo's version of vimrc. This will replace your copy. If you don't want to do so, at the very least have the vimrc lines necessaryfor Pathogen (https://github.com/tpope/vim-pathogen).

```
ln ~/.vim/vimrc ~/.vimrc
```

Finally, install dependencies and initialize the submodules.

```
sudo pip install jedi
git submodule init
git submodule update
```

Adding Plugins
---------------

git submodule add https://github.com/kien/ctrlp.vim.git bundle/ctrp.vim
