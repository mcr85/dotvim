dotvim
======

Checkout additional install steps for:
- YouCompleteMe
- Command-T
- vim-ctrlspace
- jshint
- InstantRst


command-t installation:
http://chrislaco.com/blog/gettimg-command-t-working-on-windows/

requirements:
- Vim with +ruby, command-t build with same ruby version as vim
    check vim's ruby version with this command:
    `:ruby puts "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"`
- run devkit's devkitvars.bat
- cd into command-t\ruby\command-t
- run: ruby extconf.rb
- run: make
- run: make install

