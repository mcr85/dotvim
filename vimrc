set nocompatible

"language 'pl_PL.UTF-8'

if has("autocmd")
    filetype on
    filetype plugin on
    filetype indent on
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown " .md for markdown
endif

"-------------------------------------------------------------------------------
" Plugins
" Install vim-plug: https://github.com/junegunn/vim-plug
" use vim-plug's :PlugInstall to install below plugins
"-------------------------------------------------------------------------------

call plug#begin('~/vimfiles/plugged') 		       " TODO: fix for unix .vim
Plug 'Shougo/vimproc.vim', { 'do': 'make' }            " asynchronous stuff
Plug 'Shougo/neocomplete.vim'                          " code completion
Plug 'Shougo/unite.vim'                                " CtrlP like on steroids
Plug 'Shougo/neomru.vim'                               " recent files for Unite
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " tree file explorer
Plug 'scrooloose/syntastic'                            " syntax checker
Plug 'tpope/vim-commentary'                            " commenting plugin
Plug 'Lokaltog/vim-easymotion'                         " fast char navigation
Plug 'tmhedberg/matchit'                               " enhanced go to matching pair
Plug 'bling/vim-airline'                               " fancy status bar
Plug 'jiangmiao/auto-pairs'                            " auto instert paired char
Plug 'bronson/vim-visual-star-search'                  " better search with * and #
Plug 'godlygeek/tabular'                               " text line up
Plug 'mattn/emmet-vim'                                 " html editing shortcuts
Plug 'pangloss/vim-javascript'                         " JavaScript conveniences
Plug 'maksimr/vim-jsbeautify'                          " de-obfuscate .js file - needs node module
Plug 'moll/vim-node'                                   " node.js goodies
Plug 'vim-voom/VOoM'                                   " outliner (generally for notes)
Plug 'Rykka/riv.vim'                                   " notes with reStructuredText
Plug 'Rykka/InstantRst'                                " reStructuredText live preview
call plug#end()


"-------------------------------------------------------------------------------
" GENERAL
"-------------------------------------------------------------------------------
" basic settings
set hidden          " allows to change buffer without saving file
set nobackup        " backup
set noswapfile      " swap
set nowb
set encoding=utf-8  " encoding
set ttyfast         " fast scrolling
set history=700     " history
set wildmenu        " Better command completion

" map Leader
let mapleader = ","
let maplocalleader = ","

" mouse
set mouse=a
set bs=2

" appearance and ui
set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮
set linebreak
let &showbreak='↪ '
set linespace=2
set cmdheight=1         " Height of the command bar
set background=dark
set lazyredraw
set number
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" opening new splits
set splitbelow
set splitright
set cursorline

set scrolloff=3 " at least 'n' number of lines at the top/bottom of the screen
set wildmode=longest,list   " file name completion

colorscheme hybrid

" font
if has('win32')
    set guifont=Consolas:h10:cANSI
elseif has('mac')
    set guifont=Inconsolata\ for\ Powerline:h16
elseif has('unix')
    set guifont=Ubuntu\ Mono\ 12
endif

" colors
set t_Co=256
if !has('win32')
	set term=screen-256color
endif

"-------------------------------------------------------------------------------
" GENERAL KEY BINDINGS
"-------------------------------------------------------------------------------
" quick escape
imap jk <Esc>

" repeat and go back to beginnig
nmap . .`[

" CDC = Change to Directory of Current file
" command CDC cd %:p:h

nnoremap <tab> %

" easier block indentation
vnoremap < <gv
vnoremap > >gv

" turn off annoying bindings
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>
nnoremap q: <nop>

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

" window resizing
map <S-Left> <C-w><
map <S-Down> <C-w>-
map <S-Up> <C-w>+
map <S-Right> <C-w>>

" tabs
nnoremap <A-k> :tabnext<CR>
nnoremap <A-j> :tabprevious<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-t>c :tabclose<CR>

" buffer kill
nnoremap <leader>dd :bd<cr>

" Quickfix open/close
nnoremap <leader>co :copen<cr>
nnoremap <leader>cc :cclose<cr>

" allows backspace in insert mode
set backspace=start,indent,eol

" Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv
"cnoremap s/ s/\v

"-------------------------------------------------------------------------------
" whitespace
"-------------------------------------------------------------------------------
"set noexpandtab
set showmatch
set ts=4
set sw=4
set sts=4
set smarttab
" set autoindent
set textwidth=80
set expandtab

syntax on

"-------------------------------------------------------------------------------
" Airline
"-------------------------------------------------------------------------------
 set laststatus=2
 let g:airline_powerline_fonts=1
 let g:bufferline_echo=0
 let g:airline_theme="dark"

"-------------------------------------------------------------------------------
" NERDTree
"-------------------------------------------------------------------------------
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=36

" CheckSytnax
let g:checksyntax#auto_enable_rx = "."

"-------------------------------------------------------------------------------
" EasyMotion
"-------------------------------------------------------------------------------
let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_leader_key = '<leader>'

"-------------------------------------------------------------------------------
" AutoComplete
"-------------------------------------------------------------------------------
" auto complete settings
augroup omnicomplete
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  " autocmd FileType javascript setlocal omnifunc=tern#Complete
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

"-------------------------------------------------------------------------------
" neocomplete
"-------------------------------------------------------------------------------
set completeopt-=preview
let g:neocomplete#use_vimproc=1
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#sources#buffer#cache_limit_size = 50000
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1
inoremap <expr><C-g>  neocomplete#undo_completion()
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

"-------------------------------------------------------------------------------
" UltiSnippets
"-------------------------------------------------------------------------------
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
" let g:UltiSnipsExpandTrigger="<c-l>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsListSnippets="<c-m>"

"-------------------------------------------------------------------------------
" Emmet
"-------------------------------------------------------------------------------
let g:user_emmet_expandabbr_key='<c-h>'

"-------------------------------------------------------------------------------
" Unite
"-------------------------------------------------------------------------------
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10
let g:unite_source_file_mru_limit = 20
let g:unite_prompt = '➜ '
let g:unite_marked_icon = '✓'
let g:unite_source_file_ignore_pattern =
            \ '^\%(/\|\a\+:/\)$\|\~$\|\.\%(jpg|png|gif|o|exe|dll|bak|sw[po]\)$'


call unite#custom_source('buffer,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'tmp/',
      \ 'node_modules',
      \ 'bower_components',
      \ '.sass-cache',
      \ ".jpg", ".png", ".gif", ".exe", ".dll", ".bak", ".sw[po]",
      \ ], '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#filters#sorter_default#use(['sorter_selecta'])

" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap <space> [unite]

autocmd FileType unite call s:unite_settings()

nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
if executable('pt')
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_grep_encoding = 'utf-8'
endif


function! s:unite_settings()
    nnoremap <C-p> :Unite -buffer-name=files -start-insert file_rec file<cr>
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    imap <silent><buffer><expr> <C-s> unite#do_action('split')
    imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
    imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
    nnoremap [unite]/ :Unite -buffer-name=search -start-insert grep:.<cr>
    nnoremap [unite]s :Unite -buffer-name=buffer -start-insert buffer<cr>
    nnoremap [unite]r :Unite -buffer-name=recent -start-insert file_mru<cr>
    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

"-------------------------------------------------------------------------------
" Syntastic (syntax checker)
"-------------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

"-------------------------------------------------------------------------------
" JavaScript & WEB
"-------------------------------------------------------------------------------
" vim-javascript settings
let g:html_inndent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Javascript Code Folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldlevel=99

" TernJS (javascript intelligence engine)
" let g:tern_show_argument_hints='on_hold'
" let g:tern_request_timeout=3
" let g:tern_map_prefix="<leader>"
" let g:tern_map_keys=1
