set nocompatible

" Pathogen stuff, for plugins
call pathogen#infect()
call pathogen#helptags()

if has("autocmd")
	filetype on
	filetype plugin on
    filetype indent on
endif

" backup 
set nobackup

" swap
set noswapfile

" encoding
set encoding=utf-8

" auto completion
set omnifunc=syntaxcomplete#Complete
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" allows to change buffer without saving file
set hidden

" vim-javascript settings
let g:html_inndent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Javascript Code Folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldlevel=99


" BASIC OPTIONS -----------------------------------------------------------------

" Auto-Reload vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" fast scrolling
set ttyfast

" history
set history=700

"set listchars=tab:?\ ,eol:¬,extends:?,precedes:?
set showbreak=?
au VimResized * :wincmd =

" Leader
let mapleader = ","
let maplocalleader = "\\"

" mouse
set mouse=a
set bs=2


" APPEARANCE -------------------------------------------------------------------

colors Tomorrow-Night 
if has('win32')
    set guifont=Consolas\ for\ Powerline\ FixedD:h11:b:cANSI
elseif has('mac')
    set guifont=Inconsolata\ for\ Powerline:h16
elseif has('unix')
    set guifont=Ubuntu\ Mono\ 12 
endif

set linespace=2

" openning new splits
set splitbelow
set splitright

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


" KEYMAPS ---------------------------------------------------------------------

map <tab> %

" turn off annoying bindings
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>

" turn off search highlight
nnoremap <leader>h :noh<cr>

" copy paste
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y
:nnoremap <Esc>P  P'[v']=
:nnoremap <Esc>p  p'[v']=

" file saving
map <C-S> <ESC>:w<CR>
imap <C-S> <ESC>:w<CR>

" move around windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" tabs management
nnoremap <A-k> :tabnext<CR>
nnoremap <A-j> :tabprevious<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>

" buffer kill
nnoremap <leader>bd :bd<cr>

" Quickfix open/close
nnoremap <leader>co :copen<cr>
nnoremap <leader>cc :cclose<cr>

" allows backspace in insert mode
set backspace=start,indent,eol

" generate php tags
nmap <silent> <F9>
	\ :!ctags -f ./tags
	\ --langmap="php:+.inc"
	\ -h ".php.inc" -R --totals=yes
	\ --tag-relative=yes --PHP-kinds=+cf-v .<CR>

set tags=./tags,tags

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
" let g:ackprg="Ack -H --nocolor --nogroup --column"
"let g:ackprg="Ack"
" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
" Ack for the last search.
nnoremap <silent> <leader>/ :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>
"nnoremap <silent> <leader>/ :execute "Ack! '" . substitute(substitute(substitute(@/, "\\<", "\\b", ""), "\\>", "\\b", ""), "\\v", "", "") . "'"<CR>

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
"set noexpandtab
set showmatch
set ts=4
set expandtab
set sw=4
set sts=4
"set smarttab
set autoindent
"set textwidth=80
set expandtab


" PLUGINS --------------------------------------------------------------------

" Supertab
"let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabLongestHighlight = 1
let g:SuperTabCrMapping = 1

" TernJS (javascript intelligence engine)
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1
map <F4> :TernDef<CR>

" Powerline (windows status, Obvious Mode replacement)
set laststatus=2
set t_Co=256
let g:Powerline_symbols = "fancy"

" NERDTree
map <F2> :NERDTreeToggle<CR>

" Syntastic
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['js', 'php'], 'passive_filetypes': [] }
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_open = 1
let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'


" AutoComplPop
set completeopt=longest,menuone
let g:acp_enableAtStartup = 1

" CtrlP
"let g:ctrlp_map = '<c-e>'
"let g:ctrlp_cmd = 'CtrlPBuffer'
"let g:ctrlp_match_window_reversed = 0
" CtrlP-funky (function search in CtrlP)
"let g:ctrlp_extensions = ['funky']
"nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
"let g:ctrlp_max_height=30

" Unite (CtrlP alternative)
" search files like in CtrlP
nnoremap <C-p> :Unite -start-insert file_rec<cr>
" content search like ack.vim
nnoremap <space>/ :Unite -start-insert grep:.<cr>
" buffer switching
nnoremap <space>s :Unite buffer<cr>
" recent files - mru
nnoremap <space>r :Unite file_mru<cr>
let g:unite_source_file_ignore_pattern = 
      \'^\%(/\|\a\+:/\)$\|\~$\|\.\%(o|exe|dll|bak|sw[po]\)$'
let g:unite_source_file_mru_limit = 100

" Sparkup - gives zen coding - shortcut is Ctrl + E

" UltiSnippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Multiple cursors
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_next_key='<C-d>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'

" PHP
"let php_sql_query=1
"let php_htmlInStrings=1
"let php_noShortTags=1
"let php_folding=1

:syntax on
