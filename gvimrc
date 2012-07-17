" Pathogen stuff, for plugins
call pathogen#infect()
call pathogen#helptags()

" file types
filetype plugin on
filetype indent on

if has("autocmd")
	filetype on
	filetype plugin indent on
endif

" auto completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

set hidden

"vim-javascript settings
let g:html_inndent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" colors and fonts
colors blackboard
set gfn=Monaco\ 7.5

" highlight search
set hlsearch

" incremental search, don't have to type whole word
set incsearch

" ignore casing when searching
set ignorecase

" don't ignore casing in searching when at least one letter is upper-case
set smartcase

" set line numbering
set number
"set cursorline

" see at least 'n' number of lines at the top/bottom of the screen
set scrolloff=3

" file name completion
set wildmode=longest,list

" do not wrap lines
set nowrap

set ruler

" margin line
"set colorcolumn=80

" pasting - set paste or set nopaste
set paste

" whitespace controll, autoindent has to be last one
set ts=4
set noexpandtab
set sw=4
set sts=4
set smarttab
set autoindent
