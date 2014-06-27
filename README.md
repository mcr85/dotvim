dotvim
======

Easy way to install MacVim:
Get Homebrew and make sure it's updated.
Using brew get latest python and update $PATH to point to new python installation.
brew install macvim --override-system-vim

Clone dotvim to vim config folder
	git clone git://github.com/mcr85/dotvim.git ~/.vim

Create symlinks
	ln -s ~/dotfiles/vimrc ~/.vimrc
	ln -s ~/dotfiles/gvimrc ~/.givimrc


Post dotvim clone
=================

git submodule init (check for errors)
git submodule update

cd to bundle/YouCompleteMe plugin folder and build necessary things:
  sudo ./install.sh

cd to vimproc (Unite dependency for asynchronous file search) and build things:
  # for Mac
  make -f make_mac.mak

cd to bundle/tern plugin folder and do: 
  npm install


Windows
=======
Requirements:

Vim with Lua support

Install Python

Install Node

install jshint - Syntastic plugin uses this for checking syntax errors
  npm install -g jshint

cd to vimproc (Unite dependency for asynchronous file search). 
Find vimproc_win32.dll builds in vimproc's readme and copy it to bundle\vimproc\autoload

cd to bundle/tern plugin folder and do: 
  npm install
