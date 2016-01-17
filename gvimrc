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
endif

"-------------------------------------------------------------------------------
" Plugins
" Install vim-plug: https://github.com/junegunn/vim-plug
" use vim-plug's :PlugInstall to install below plugins
"-------------------------------------------------------------------------------

call plug#begin('~/' . vim_home . '/plugged')
" vim general ------------------------------------------------------------------
Plug 'jnurmine/Zenburn'                                " zenburn theme
Plug 'altercation/vim-colors-solarized'                " solarized theme
Plug 'crusoexia/vim-monokai'                           " monokai theme
Plug 'nelstrom/vim-qargs'                              " run commands on Quickfix results
Plug 'bling/vim-airline'                               " fancy status bar
Plug 'editorconfig/editorconfig-vim'                   " editor
" editing ----------------------------------------------------------------------
Plug 'sickill/vim-pasta'			                   " context aware paste
Plug 'jiangmiao/auto-pairs'                            " auto instert paired char
Plug 'honza/vim-snippets'                              " snippets
Plug 'tmhedberg/matchit'                               " enhanced go to matching pair
Plug 'Lokaltog/vim-easymotion'                         " fast char navigation
Plug 'godlygeek/tabular'                               " text line up
Plug 'osyo-manga/vim-over'                             " peek search and replace
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
" searching & project traversal ------------------------------------------------
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'JazzCore/ctrlp-cmatcher'
Plug 'jasoncodes/ctrlp-modified.vim'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'sgur/ctrlp-extensions.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'd11wtq/ctrlp_bdelete.vim'
Plug 'dyng/ctrlsf.vim'                                 " sublime-like text searching
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " tree file explorer
Plug 'airblade/vim-gitgutter'                          " git helper
Plug 'bronson/vim-visual-star-search'                  " better search with * and #
" coding -----------------------------------------------------------------------
Plug 'mattn/emmet-vim'                                 " html editing shortcuts
Plug 'ervandew/supertab'                               " tab for completions
Plug 'SirVer/ultisnips'                                " snippets plugin
Plug 'Valloric/YouCompleteMe'                          " code completion
Plug 'scrooloose/syntastic'                            " syntax checker
Plug 'tpope/vim-commentary'                            " commenting plugin
" javascript -------------------------------------------------------------------
Plug 'othree/yajs.vim', { 'for': 'javascript' }        " JavaScript syntax
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' } " More JavaScript goodies
Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " JavaScript conveniences
Plug 'crusoexia/vim-javascript-lib', { 'for': 'javascript' } " Syntax highlight for common js libs - pangloss companion
Plug 'burnettk/vim-angular', { 'for': 'javascript' }   " angularjs plugin 
Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript' } " de-obfuscate .js file - needs node module TODO: replace below with vim-esformatter
Plug 'moll/vim-node', { 'for': 'javascript' }          " node.js goodies
Plug 'ahayman/vim-nodejs-complete', { 'for': 'javascript' }
Plug 'digitaltoad/vim-jade'
Plug 'groenewege/vim-less'
Plug 'wavded/vim-stylus'
" orginizer --------------------------------------------------------------------
Plug 'vim-voom/VOoM'                                   " outliner (generally for notes)
Plug 'Rykka/riv.vim'                                   " notes with reStructuredText
Plug 'Rykka/InstantRst'                                " reStructuredText live preview
Plug 'KabbAmine/vCoolor.vim'                           " color picker
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
set nolazyredraw    " don't redraw while executing macros
set history=700     " history
set wildmenu        " Better command completion
set incsearch       " jump to search
set ignorecase      " ignore case when searching
set virtualedit=block " visual edit block

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
set showtabline=0

" switching buffers
nnoremap ,, *<C-^>
nnoremap <leader>l :ls <CR> :b<space>

" opening new splits
set splitbelow
set splitright
set cursorline

set scrolloff=3 " at least 'n' number of lines at the top/bottom of the screen
set wildmode=longest,list   " file name completion

colorscheme zenburn
" let g:solarized_visibility = 'high'
" let g:monokai_italic = 1
" let g:monokai_thick_border = 1
" let g:monokai_zentree = 1

" font
if has('win32')
    set guifont=Consolas:h11:cEASTEUROPE
elseif has('mac')
    set guifont=Monaco\ for\ Powerline:h13
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
command! CDC cd %:p:h

nnoremap <tab> %

" override plugin mapping
nunmap <C-I>

" easier block indentation
vnoremap < <gv
vnoremap > >gv

" turn off annoying bindings
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>
nnoremap q: <nop>

" search & replace

" nnoremap <leader>l :ls <CR> :b<space>
nnoremap <Leader>r :OverCommandLine <CR>:%s/
" substitute word under cursor on current line
nnoremap <Leader>n :s/\<<C-r><C-w>\>//g<Left><Left>
" substitute word under cursor in whole document
nnoremap <Leader>m :%s/\<<C-r><C-w>\>//g<Left><Left>

" toggle search highlight
nnoremap <leader>h :set hlsearch!<cr>

" copy paste
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=

" file saving
map <C-S> <ESC>:w<CR>
imap <C-S> <ESC>:w<CR>

" move around windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" window resizing
map <S-Left> <C-w>5<
map <S-Down> <C-w>5-
map <S-Up> <C-w>5+
map <S-Right> <C-w>5>

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
" let g:airline#extensions#tabline#enabled = 1
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

"-------------------------------------------------------------------------------
" NERDTree
"-------------------------------------------------------------------------------
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeMirror<CR>
let NERDTreeWinSize=36
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.js.map$']

"-------------------------------------------------------------------------------
" Voom
"-------------------------------------------------------------------------------
map <F4> :VoomToggle<CR>

"-------------------------------------------------------------------------------
" UltiSnips
"-------------------------------------------------------------------------------
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

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
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

"-------------------------------------------------------------------------------
" neocomplete
"-------------------------------------------------------------------------------
" set completeopt-=preview
" let g:neocomplete#use_vimproc=1
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#sources#buffer#cache_limit_size = 50000
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 1
" inoremap <expr><C-g>  neocomplete#undo_completion()
" inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplete#close_popup()
" inoremap <expr><C-e>  neocomplete#cancel_popup()

"-------------------------------------------------------------------------------
" Emmet
"-------------------------------------------------------------------------------
let g:user_emmet_expandabbr_key='<c-l>'

"-------------------------------------------------------------------------------
" over.vim - powered up search & replace
"-------------------------------------------------------------------------------
nnoremap <leader>l :ls <CR> :b<space>

"-------------------------------------------------------------------------------
" CtrlP
"-------------------------------------------------------------------------------
call ctrlp_bdelete#init()

let g:ctrlp_working_path_mode = 'c'

nnoremap <C-P> :CtrlPRoot<CR>
nnoremap <A-Up> :CtrlP<CR>
nnoremap <C-Space> :CtrlPBuffer<CR>
nmap <Leader>o :CtrlPFunky<CR>
command! RECENT :CtrlPMRU<CR>

"-------------------------------------------------------------------------------
" CtrlSF
"-------------------------------------------------------------------------------
nmap <Leader>sf <Plug>CtrlSFPrompt
nmap <Leader>sw <Plug>CtrlSFCwordExec<cr>
nmap <Leader>sv <Plug>CtrlSFVwordExec<cr>

"-------------------------------------------------------------------------------
" Syntastic (syntax checker)
"-------------------------------------------------------------------------------
let g:syntastic_auto_jump = 3
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"-------------------------------------------------------------------------------
" JavaScript & WEB
"-------------------------------------------------------------------------------
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

" vim-javascript settings
let g:html_inndent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Javascript Code Folding
syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldmethod=syntax
setlocal foldlevel=99

" JsBeautify
command! Beautify call JsBeautify()
