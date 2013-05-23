set nocompatible

" Pathogen stuff, for plugins
call pathogen#infect()
call pathogen#helptags()

if has("autocmd")
	filetype on
	filetype plugin indent on
endif

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

"set listchars=tab:?\ ,eol:¬,extends:?,precedes:?
set showbreak=?
au VimResized * :wincmd =
" Leader
let mapleader = ","
let maplocalleader = "\\"


" APPEARANCE --------------------------------------------------------------------

colors Tomorrow-Night
"set gfn=Consolas\ 13
set guifont=Consolas
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

" allows backspace in insert mode
set backspace=start,indent,eol

" paste and reformat/reindent
:nnoremap <Esc>P  P'[v']=
:nnoremap <Esc>p  p'[v']=

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
set ts=4
"set noexpandtab
set expandtab
set sw=4
set sts=4
set smarttab
set autoindent
set textwidth=80


" PLUGINS --------------------------------------------------------------------

" Supertab
"let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabLongestHighlight = 1
let g:SuperTabCrMapping = 1

" TernJS (javascript intelligence engine)
map <F4> :TernDef<CR>

" Obvious Mode
set laststatus=2

" NERDTree
map <F2> :NERDTreeToggle<CR>

" Syntastic
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['js', 'php'], 'passive_filetypes': [] }

" AutoComplPop
set completeopt=longest,menuone
let g:acp_enableAtStartup = 1

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window_reversed = 0
" CtrlP-funky (function search in CtrlP)
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

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

