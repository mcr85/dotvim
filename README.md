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

cd to YouCompleteMe plugin folder and build necessary things:
  sudo ./install.sh

cd to tern plugin folder and do: 
  npm install

cd to vimproc (Unite dependency for asynchronous file search) and build things:
  # for Mac
  make -f make_mac.mak
