" TODO: manually run lsp servers - currently I have an instance of tsserver and typescript server on one file.

" One is from nvim-lspinstall, another from manual setup in lsp-config
let vim_home = '.config/nvim'
" set notimeout
set timeoutlen=500

"-------------------------------------------------------------------------------
" GENERAL
"-------------------------------------------------------------------------------
" basic settings
set nocompatible
set ai              " auto indent
set si              " smart indent
set sc
set hidden          " allows to change buffer without saving file
set nobackup        " backup
set noswapfile      " swap
set nowrap
set undodir=~/.vim/undodir      " do not create .un~ files
set undofile
set nowb
set encoding=utf-8  " encoding
set ttyfast         " fast scrolling
set lazyredraw
set history=700     " history
set wildmenu        " Better command completion
set ignorecase
set smartcase
set wildignorecase
set incsearch       " jump to search
set virtualedit=block " visual edit block
set number
" set laststatus=3
" set relativenumber
" set signcolumn=auto
set signcolumn=yes
set scrolloff=3 " at least 'n' number of lines at the top/bottom of the screen
set wildmode=longest:full,full   " file name completion
" set completeopt=menu,menuone,noselect
set synmaxcol=160
set list
set termguicolors
set updatetime=100
set formatoptions-=o
syntax sync minlines=256

" opening new splits
set splitbelow
set splitright
set cursorline


"-------------------------------------------------------------------------------
" commands & functions
"-------------------------------------------------------------------------------
autocmd FileType * set formatoptions-=o
"TODO: too slow
" autocmd TextYankPost * call system('win32yank.exe -i --crlf', @")

" function! Paste(mode)
"     let @" = system('win32yank.exe -o --lf')
"     return a:mode
" endfunction

" map <expr> p Paste('p')
" map <expr> P Paste('P')
" autocmd TextYankPost * call system('win32yank.exe -i --crlf', @")

" function! Paste(mode)
"     let @" = system('win32yank.exe -o --lf')
"     return a:mode
" endfunction

" map <expr> p Paste('p')
" map <expr> P Paste('P')

"-------------------------------------------------------------------------------
" whitespace
"-------------------------------------------------------------------------------
"set noexpandtab
" set showmatch
set ts=2
set sw=2
set sts=2
set smarttab
set autoindent
filetype plugin indent on
set textwidth=256
set expandtab
set foldlevelstart=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" map Leader
let mapleader = ","
let maplocalleader = ","

" mouse
" set ttymouse=sgr
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
" set guioptions-=m  "remove menu bar
" set guioptions-=T  "remove toolbar
" set guioptions-=r  "remove right-hand scroll bar
" set guioptions-=L  "remove left-hand scroll bar
set showtabline=0


" spell
" set spelllang=en

"-------------------------------------------------------------------------------
" Plugins
" Install vim-plug: https://github.com/junegunn/vim-plug
" use vim-plug's :PlugInstall to install below plugins
"-------------------------------------------------------------------------------

call plug#begin('~/' . vim_home . '/plugged')
Plug 'lewis6991/impatient.nvim'

" vim general ------------------------------------------------------------------
" Plug 'mhartington/oceanic-next'
" Plug 'Mofiqul/vscode.nvim'
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
" Plug 'liuchengxu/vim-which-key'
Plug 'folke/which-key.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'glepnir/galaxyline.nvim'
" Plug 'akinsho/toggleterm.nvim'
Plug 'famiu/feline.nvim'
Plug 'famiu/bufdelete.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'AckslD/nvim-neoclip.lua'

" editing ----------------------------------------------------------------------
Plug 'jdhao/better-escape.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'sickill/vim-pasta'                               " context aware paste
Plug 'windwp/nvim-autopairs'                           " auto instert paired char
Plug 'matze/vim-move'                                  " move selection and maintain indentation
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-sleuth'                              " TODO: check out later
Plug 'tmhedberg/matchit'                               " enhanced go to matching pair

" searching & project traversal ------------------------------------------------
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'kevinhwang91/nvim-bqf'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ahmedkhalf/project.nvim'
" TODO: investigate sidebar.nvim
Plug 'bronson/vim-visual-star-search'                  " better search with * and #
Plug 'kevinhwang91/nvim-hlslens'
Plug 'petertriho/nvim-scrollbar'
" Plug 'f-person/git-blame.nvim'
 " Plug 'windwp/nvim-spectre'                             "project wide search and replace // TODO: try replace with nvim-spectre
" Plug 'brooth/far.vim'
Plug 'tpope/vim-fugitive'                              " git integration
" Plug 'sindrets/diffview.nvim'                        " TODO: check this out, outdated git in ubuntu - need newer version
" Plug 'TimUntersberger/neogit'                        " TOOD: check; integrates with diffview.nvim
Plug 'mhinz/vim-grepper'
" neogit - check it out
" Plug 'ggandor/lightspeed.nvim'
Plug 'phaazon/hop.nvim'

" coding -----------------------------------------------------------------------
Plug 'numToStr/Comment.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mattn/emmet-vim'                                 " html editing shortcuts

" IDE ----------------------------------------------------------------------
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
" Plug 'kabouzeid/nvim-lspinstall'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'David-Kunz/cmp-npm'
Plug 'glepnir/lspsaga.nvim'
Plug 'onsails/lspkind-nvim'
" Plug 'mhartington/formatter.nvim'
" Plug 'RRethy/vim-illuminate'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lewis6991/gitsigns.nvim'
" Plug 'nvim-neotest/neotest' " TODO: check it out
" nvim-dap

" tools ------------------------------------------------------------------------
"NTBBloodbath/rest.nvim"
" debugging --------------------------------------------------------------------
Plug 'metakirby5/codi.vim'                             " Quokka like plugin
" Plug 'michaelb/sniprun' " try that instead of codi.vim
Plug 'kamykn/spelunker.vim'
" Plug 'dstein54/vim-startuptime'

" service ----------------------------------------------------------------------
Plug 'wakatime/vim-wakatime'

call plug#end()

luafile ~/.config/nvim/lua/init.lua

"-------------------------------------------------------------------------------
" THEME
"-------------------------------------------------------------------------------
"
" For Neovim 0.1.3 and 0.1.4
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim > 0.1.5
" if (has("termguicolors"))
"   set termguicolors
"   print("has term gui colors")
" endif

" set t_Co=256
syntax enable
" colorscheme OceanicNext
let g:gruvbox_italic_keyword = 1
let g:gruvbox_italic_function = 1
colorscheme gruvbox-baby

"-------------------------------------------------------------------------------
" GENERAL KEY BINDINGS
"-------------------------------------------------------------------------------
"
" quick escape
" inoremap jk <Esc>

" supercharged dot
" nnoremap . *Ncgn

" repeat and go back to beginnig
" nmap . .`[

" exit terminal mode
" tnoremap <Esc> <C-\><C-n>

" CDC = Change to Directory of Current file
command! CDC cd %:p:h

" nnoremap <tab> %

" override plugin mapping
" ununmap <C-I>

" easier block indentation
vnoremap < <gv
vnoremap > >gv
vnoremap q <C-V>

" turn off annoying bindings
nnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap K <nop>
nnoremap q: <nop>

" search & replace
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" nnoremap <leader>l :ls <CR> :b<space>
" substitute word under cursor on current line
" nnoremap <Leader>n :s/\<<C-r><C-w>\>//g<Left><Left>
" substitute word under cursor in whole document
" nnoremap <Leader>m :%s/\<<C-r><C-w>\>//g<Left><Left>

" toggle search highlight
nnoremap <Space> :set hlsearch!<cr>

" copy paste
" nmap <C-V> "+gP
" imap <C-V> <ESC><C-V>i
" vmap <C-C> "+y
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=

" file saving
nnoremap <C-S> <ESC>:w<CR>
inoremap <C-S> <ESC>:w<CR>

" move around windows
 " if has('nvim')
  " Hack to get C-h working in NeoVim
  " nmap <BS> <C-W>h
" endif

" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-l> <c-w>l
" nnoremap <c-h> <c-w>h

" window resizing
map <S-Left> <C-w>5<
map <S-Down> <C-w>5-
map <S-Up> <C-w>5+
map <S-Right> <C-w>5>

" tabs
nnoremap <tab> :bnext<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <S-tab> :bprev<CR>
nnoremap <C-t>c :tabclose<CR>

" buffer kill
nnoremap <leader>dd :Bdelete! %d<cr>
nnoremap <C-x> :Bdelete! %d<cr>

" allows backspace in insert mode
set backspace=start,indent,eol

" Toggle [i]nvisible characters
" nnoremap <leader>i :set list!<CR>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

" quickfix list
nnoremap <silent> <C-q> :call ToggleQuickFix()<cr>
nnoremap <silent> <F13> :cnext<cr>
nnoremap <silent> <F14> :cprev<cr>

" local list
nnoremap <silent> <leader>q :lopen<cr>
nnoremap <silent> <leader>j :lnext<cr>
nnoremap <silent> <leader>k :lprev<cr>

" set spell check on demand
" nnoremap <silent> <F9> :set spell!<cr>
" inoremap <silent> <F9> <C-O>:set spell!<cr>

"-------------------------------------------------------------------------------
" vim-session
"-------------------------------------------------------------------------------
let g:session_autoload = 'no'
let g:session_autosave = 'yes'

"-------------------------------------------------------------------------------
" EasyMotion
"-------------------------------------------------------------------------------
" let g:EasyMotion_leader_key = '<leader>'

"-------------------------------------------------------------------------------
" vim-move
"-------------------------------------------------------------------------------
let g:AutoPairsCenterLine = 0
 
"-------------------------------------------------------------------------------
" bufferline.nvim
"-------------------------------------------------------------------------------
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>

"-------------------------------------------------------------------------------
" Emmet
"-------------------------------------------------------------------------------
augroup EmmetSettings
  autocmd! FileType html imap <C-E> <plug>(emmet-expand-abbr)
augroup END

" nnoremap <leader>l :ls <CR> :b<space>

" set
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules,*/bower_components

"-------------------------------------------------------------------------------
" Git
"-------------------------------------------------------------------------------
let g:gitblame_date_format = '%r, (%d.%m.%Y %H:%M)'

"-------------------------------------------------------------------------------
" Telescope
"-------------------------------------------------------------------------------

" Using lua functions
nnoremap <C-P> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <C-Space> <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fu <cmd>lua require('telescope.builtin').lsp_references<cr>
nnoremap <leader><Space> <cmd>lua require'telescope'.extensions.file_browser.file_browser({ path = require('telescope.utils').buffer_dir() })<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <C-_> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>v <cmd>lua require('telescope').extensions.neoclip.neoclip()<cr>

"-------------------------------------------------------------------------------
" nvim-tree
"-------------------------------------------------------------------------------
let g:nvim_tree_disable_window_picker = 1

nnoremap <silent> <F1> :NvimTreeToggle<CR>
nnoremap <silent> <leader>r :NvimTreeRefresh<CR>
nnoremap <silent> <leader>n :NvimTreeFindFile<CR>
nnoremap <silent> <F10> :NvimTreeFindFile<CR>

"-------------------------------------------------------------------------------
" nvim-spectre
"-------------------------------------------------------------------------------
nnoremap <leader>S :lua require('spectre').open()<CR>

"search current word
nnoremap <leader>sw :lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>s :lua require('spectre').open_visual()<CR>
"  search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>

"-------------------------------------------------------------------------------
" fugitive.git
"-------------------------------------------------------------------------------
nmap <leader>gj :diffget //3<CR> 
nmap <leader>gf :diffget //2<CR> 
nmap <leader>gs :G<CR> 


"-------------------------------------------------------------------------------
" Spelunker
"-------------------------------------------------------------------------------
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE
