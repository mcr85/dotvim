set nocompatible

"language 'pl_PL.UTF-8'

if has("autocmd")
    filetype on
    filetype plugin on
    filetype indent on
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown " .md for markdown
endif

if has('win32')
    let vim_home = 'vimfiles'
else
    let vim_home = '.vim'

"-------------------------------------------------------------------------------
" Plugins
" Install vim-plug: https://github.com/junegunn/vim-plug
" use vim-plug's :PlugInstall to install below plugins
"-------------------------------------------------------------------------------

call plug#begin('~/' . vim_home . '/plugged')
Plug 'Shougo/vimproc.vim', { 'do': 'make' }            " asynchronous stuff
Plug 'Shougo/neocomplete.vim'                          " code completion
Plug 'kien/ctrlp.vim'                                  " fuzzy goto file
Plug 'dyng/ctrlsf.vim'                                 " sublime-like text searching
Plug 'FelikZ/ctrlp-py-matcher'                         " make CtrlP faster
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
Plug 'othree/javascript-libraries-syntax.vim'          " More JavaScript goodies
Plug 'burnettk/vim-angular'                            " angularjs plugin
Plug 'maksimr/vim-jsbeautify'                          " de-obfuscate .js file - needs node module
Plug 'moll/vim-node'                                   " node.js goodies
Plug 'jaxbot/browserlink.vim'                          " web live coding
Plug 'vim-voom/VOoM'                                   " outliner (generally for notes)
Plug 'Rykka/riv.vim'                                   " notes with reStructuredText
Plug 'Rykka/InstantRst'                                " reStructuredText live preview
Plug 'airblade/vim-gitgutter'                          " git helper
call plug#end()


"-------------------------------------------------------------------------------
" GENERAL
"-------------------------------------------------------------------------------
" basic settings
set hidden          " allows to change buffer without saving file
set nobackup        " backup
set noswapfile      " swap
set noundofile      " do not create .un~ files
set nowb
set encoding=utf-8  " encoding
set ttyfast         " fast scrolling
set history=700     " history
set wildmenu        " Better command completion
set incsearch       " jump to search
set ignorecase      " ignore case when searching

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
    set guifont=Inconsolata-g\ for\ Powerline:h12
elseif has('unix')
    set guifont=Ubuntu\ Mono\ 12
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
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="tomorrow"

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
let g:user_emmet_expandabbr_key='<c-x>'

"-------------------------------------------------------------------------------
" CtrlP
"-------------------------------------------------------------------------------
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_user_command = 'ag --nogroup --nobreak --noheading --nocolor -g "" %s '

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
