if has('win32')
    let vim_home = 'vimfiles'
else
    let vim_home = '.vim'
endif

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

"-------------------------------------------------------------------------------
" Plugins
" Install vim-plug: https://github.com/junegunn/vim-plug
" use vim-plug's :PlugInstall to install below plugins
"-------------------------------------------------------------------------------

call plug#begin('~/' . vim_home . '/plugged')
" vim general ------------------------------------------------------------------
Plug 'neomake/neomake'
Plug 'xolox/vim-session'                               " session management
Plug 'xolox/vim-misc'
Plug 'xolox/vim-shell'
Plug 'jnurmine/Zenburn'                                " zenburn theme
Plug 'mhartington/oceanic-next'
" Plug 'nelstrom/vim-qargs'                              " run commands on Quickfix results
Plug 'bling/vim-airline'                               " fancy status bar
" editing ----------------------------------------------------------------------
Plug 'sickill/vim-pasta'			                   " context aware paste
Plug 'jiangmiao/auto-pairs'                            " auto instert paired char
Plug 'honza/vim-snippets'                              " snippets
Plug 'matze/vim-move'                                  " move selection and maintain indentation
Plug 'Lokaltog/vim-easymotion'                         " fast char navigation
Plug 'godlygeek/tabular'                               " text line up
Plug 'osyo-manga/vim-over'                             " peek search and replace
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tmhedberg/matchit'                               " enhanced go to matching pair
Plug 'tpope/vim-repeat'
" searching & project traversal ------------------------------------------------
Plug 'tpope/vim-fugitive'                             " git integration
Plug 'wincent/loupe'
Plug 'wincent/ferret'
" Plug 'haya14busa/incsearch.vim'
" Plug 'rking/ag.vim'
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
Plug 'tpope/vim-commentary'                            " commenting plugin
" javascript -------------------------------------------------------------------
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' } " More JavaScript goodies
Plug 'othree/jspc.vim', { 'for': 'javascript' }        " funciton parameter completion
Plug 'davidosomething/vim-jsdoc'                       " Helps creating JSDoc comments
Plug 'mxw/vim-jsx'
Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript' } " de-obfuscate .js file - needs node module TODO: replace below with vim-esformatter
Plug 'ternjs/tern_for_vim'
Plug 'groenewege/vim-less'
" orginizer --------------------------------------------------------------------
" Plug 'Rykka/riv.vim'                                   " notes with reStructuredText
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
set wildignorecase
set incsearch       " jump to search
set smartcase
" set ignorecase      " ignore case when searching
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
set t_Co=256
syntax enable
colorscheme OceanicNext

if (has("termguicolors"))
   set termguicolors
 endif

" switching buffers
nnoremap <leader>l :ls <CR> :b<space>
nnoremap <C-S-L> :bnext<CR>
nnoremap <C-S-H> :bprev<CR>

" opening new splits
set splitbelow
set splitright
set cursorline

set scrolloff=3 " at least 'n' number of lines at the top/bottom of the screen
set wildmode=longest,list   " file name completion

" font
if has('win32')
    set guifont=Consolas:h11:cEASTEUROPE
elseif has('mac')
    set guifont=Sauce\ Code\ Powerline:h14
elseif has('unix')
    set guifont=Ubuntu\ Mono\ 12
endif

"-------------------------------------------------------------------------------
" GENERAL KEY BINDINGS
"-------------------------------------------------------------------------------
" quick escape
imap jk <Esc>

" supercharged dot
nnoremap . *Ncgn

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
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

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
 if has('nvim')
  " Hack to get C-h working in NeoVim
  nmap <BS> <C-W>h
endif

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
" nnoremap <c-h> <c-w>h

" window resizing
map <S-Left> <C-w>5<
map <S-Down> <C-w>5-
map <S-Up> <C-w>5+
map <S-Right> <C-w>5>

" tabs
nnoremap <M-S-k> :tabnext<CR>
nnoremap <M-S-j> :tabprevious<CR>
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

"-------------------------------------------------------------------------------
" whitespace
"-------------------------------------------------------------------------------
"set noexpandtab
set showmatch
set ts=2
set sw=2
set sts=2
set smarttab
set autoindent
filetype plugin indent on
set textwidth=80
set expandtab

"-------------------------------------------------------------------------------
" vim-session
"-------------------------------------------------------------------------------
let g:session_autoload = 'no'
let g:session_autosave = 'yes'

"-------------------------------------------------------------------------------
" Airline
"-------------------------------------------------------------------------------
set laststatus=2
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts=1
let g:bufferline_echo=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#fnamemod = ':t'
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
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"-------------------------------------------------------------------------------
" NERDTree
"-------------------------------------------------------------------------------
map <F1> :NERDTreeToggle<CR>
let NERDTreeWinSize=36
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.js.map$']

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
let g:EasyMotion_leader_key = '<leader>'

"-------------------------------------------------------------------------------
" YouCompleteMe
"-------------------------------------------------------------------------------
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"-------------------------------------------------------------------------------
" Deoplete
"-------------------------------------------------------------------------------
" set completeopt-=preview

" let g:deoplete#enable_at_startup = 1
" let g:tern_request_timeout = 1
" let g:tern_show_signature_in_pum = 0
" let g:tern#command = ["tern"]
" let g:tern#arguments = ["--persistent"]

" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"

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

let g:ctrlp_working_path_mode = ''
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'

nnoremap <C-P> :CtrlP<CR>
nnoremap <C-A-P> :CtrlPCurFile<CR>
nnoremap <M-Space> :CtrlPBuffer<CR>
nnoremap <Leader>o :CtrlPFunky<CR>
nnoremap <Leader>t :CtrlPTag<CR>
command! RECENT :CtrlPMRU<CR>

" set
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules,*/bower_components

"-------------------------------------------------------------------------------
" CtrlSF
"-------------------------------------------------------------------------------
map <F3> :CtrlSFToggle<CR>
nmap <Leader>sf <Plug>CtrlSFPrompt
nmap <Leader>sw <Plug>CtrlSFCwordExec<cr>
nmap <Leader>sv <Plug>CtrlSFVwordExec<cr>

"-------------------------------------------------------------------------------
" Syntastic (syntax checker)
"-------------------------------------------------------------------------------
map <F2> :lnext<CR>

function! neomake#makers#ft#javascript#eslint()
    return {
        \ 'args': ['-f', 'compact'],
        \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
        \ '%W%f: line %l\, col %c\, Warning - %m'
        \ }
endfunction

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_open_list = 1
autocmd! BufWritePost * Neomake

"-------------------------------------------------------------------------------
" JavaScript & WEB
"-------------------------------------------------------------------------------
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 1
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

" JsBeautify
command! Beautify call JsBeautify()

"-------------------------------------------------------------------------------
" riv.vim (reStructuredText)
"-------------------------------------------------------------------------------
let main_project = { 'Name': 'Notes', 'path': '~/Dropbox/Notes',}
let g:riv_projects = [main_project]
