" Pathogen stuff, for plugins
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" highlight search
set hlsearch

" incremental search, don't have to type whole word
set incsearch

set autoindent

" tab space
set ts=2

" ignore casing when searching
set ignorecase

" don't ignore casing in searching when at least one letter is upper-case
set smartcase

" set line numbering
set number

set cursorline

" see at least 'n' number of lines at the top/bottom of the screen
set scrolloff=5

" file name completion
set wildmode=longest,list

" do not wrap lines
set nowrap

" margin line
set colorcolumn=80

" pasting - set paste or set nopaste
set paste
