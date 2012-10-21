set nocompatible

" Pathogen stuff, for plugins
call pathogen#infect()
call pathogen#helptags()

" file types
filetype plugin on
filetype indent on
"
if has("autocmd")
	filetype on
	filetype plugin indent on
endif

" auto completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" allows to change buffer without saving file
set hidden

"vim-javascript settings
let g:html_inndent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" BASIC OPTIONS -----------------------------------------------------------------
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪
au VimResized * :wincmd =
" Leader
let mapleader = ","
let maplocalleader = "\\"

" APPEARANCE --------------------------------------------------------------------
colors vividchalk
set gfn=UbuntuMono\ 11
" set line numbering
set number
set linespace=2
"set ruler
" margin line
"set colorcolumn=80

" Only show cursorline in the current window and in normal mode.
"augroup cline
"	au!
"	au WinLeave * set nocursorline
"	au WinEnter * set cursorline
"	au InsertEnter * set nocursorline
"	au InsertLeave * set cursorline
" augroup END
 set cursorline

" KEYMAPS
map <tab> %

" Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>

" SEARCH OPTIONS ----------------------------------------------------------------
" highlight search
set hlsearch
" incremental search, don't have to type whole word
set incsearch
" ignore casing when searching
set ignorecase
" don't ignore casing in searching when at least one letter is upper-case
set smartcase
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
" Ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
" Ack for the last search.
nnoremap <silent> <leader>/ :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>

" Visual Mode */# from Scrooloose
function! s:VSetSearch()
	let temp = @@
	norm! gvy
	let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
	let @@ = temp
endfunction

" BEHAVIOUR --------------------------------------------------------------------
" see at least 'n' number of lines at the top/bottom of the screen
set scrolloff=3

" file name completion
set wildmode=longest,list

" do not wrap lines
set nowrap

" pasting - set paste or set nopaste
"set paste - this brakes supertab

" whitespace controll, autoindent has to be last one
set ts=4
"set noexpandtab
set expandtab
set sw=4
set sts=4
set smarttab
set autoindent
set textwidth=80

" PLUGINS --------------------------------------------------------------------

" FuzzyFinder
nnoremap <leader> f     :FufFile<CR>
nnoremap <leader> b     :FufBuffer<CR>
nnoremap <leader> t     :FufTag<CR>

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestHighlight = 1
let g:SuperTabCrMapping = 1

" Obvious Mode
set laststatus=2

" Tagbar
nmap <F8> :TagbarToggle<CR>

" NERDTree
map <F2> :NERDTreeToggle<CR>

" Syntastic
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['js', 'php'], 'passive_filetypes': [] }

" AutoComplPop
set completeopt+=longest
let g:acp_enableAtStartup = 1

" neocomplcache -- START
" Disable AutoComplPop.
let g:acp_enableAtStartup = 1
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
" let g:neocomplcache_min_syntax_length = 3
" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1
" neocomplcache -- END

" FuzzyFinder
nnoremap <leader>f :FufFile<CR>
nnoremap <leader>b :FufBuffer<CR>
nnoremap <leader>t :FufTag<CR>

" Sparkup - gives zen coding - shortcut is Ctrl + E
