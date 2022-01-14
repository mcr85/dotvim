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
" set completeopt=menu,menuone,noselect
set number
" set relativenumber
set signcolumn=yes
set scrolloff=3 " at least 'n' number of lines at the top/bottom of the screen
set wildmode=longest,list   " file name completion
set synmaxcol=160
set list
set termguicolors
syntax sync minlines=256

" opening new splits
set splitbelow
set splitright
set cursorline


"-------------------------------------------------------------------------------
" commands & functions
"-------------------------------------------------------------------------------
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
set textwidth=80
set expandtab
setlocal foldmethod=syntax
setlocal nofoldenable

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


" spell
set spelllang=en

"-------------------------------------------------------------------------------
" Plugins
" Install vim-plug: https://github.com/junegunn/vim-plug
" use vim-plug's :PlugInstall to install below plugins
"-------------------------------------------------------------------------------

call plug#begin('~/' . vim_home . '/plugged')
" Plug 'dstein54/vim-startuptime'
" vim general ------------------------------------------------------------------
" Plug 'mhartington/oceanic-next'
" Plug 'rafamadriz/gruvbox'
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
" Plug 'liuchengxu/vim-which-key'
" Plug 'folke/which-key.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'glepnir/galaxyline.nvim'
Plug 'akinsho/toggleterm'
" https://github.com/akinsho/toggleterm.nvim TODO: investigate
Plug 'kevinhwang91/nvim-bqf'
"
Plug 'famiu/feline.nvim'
Plug 'akinsho/bufferline.nvim'
" editing ----------------------------------------------------------------------
Plug 'terryma/vim-multiple-cursors'
" Plug 'w0rp/ale'
Plug 'sickill/vim-pasta'			                         " context aware paste
Plug 'jiangmiao/auto-pairs'                            " auto instert paired char
Plug 'matze/vim-move'                                  " move selection and maintain indentation
" Plug 'Lokaltog/vim-easymotion'                         " fast char navigation
Plug 'justinmk/vim-sneak'                              " fast char navigation to first two chars
Plug 'godlygeek/tabular'                               " text line up
" Plug 'osyo-manga/vim-over'                             " peek search and replace
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-unimpaired'
Plug 'tmhedberg/matchit'                               " enhanced go to matching pair
Plug 'tpope/vim-repeat'
" searching & project traversal ------------------------------------------------
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'kyazdani42/nvim-tree.lua'
" TODO: investigate sidebar.nvim
Plug 'bronson/vim-visual-star-search'                  " better search with * and #
Plug 'lewis6991/gitsigns.nvim'
" Plug 'f-person/git-blame.nvim'
Plug 'brooth/far.vim'                                  "project wide search and replace
Plug 'tpope/vim-fugitive'                              " git integration
" Plug 'sindrets/diffview.nvim'                          " TODO: check this out
Plug 'mhinz/vim-grepper'
" neogit - check it out
" Plug 'wfxr/minimap.vim'
" hop.nvim - sprawdzić
" coding -----------------------------------------------------------------------
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
Plug 'folke/lsp-colors.nvim'
" Plug 'mhartington/formatter.nvim'
" Plug 'RRethy/vim-illuminate'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/nvim-treesitter-angular'
" tools ------------------------------------------------------------------------
"NTBBloodbath/rest.nvim"
" debugging --------------------------------------------------------------------
" vimspector
" nvim-dap
Plug 'metakirby5/codi.vim'                             " Quokka like plugin
" Plug 'mattn/emmet-vim'                                 " html editing shortcuts
Plug 'tpope/vim-commentary'                            " commenting plugin
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
colorscheme gruvbox-baby
" let g:gruvbox_italic_keyword = 1
" let g:gruvbox_italic_function = 1

"-------------------------------------------------------------------------------
" GENERAL KEY BINDINGS
"-------------------------------------------------------------------------------
"
" quick escape
inoremap jk <Esc>

" supercharged dot
nnoremap . *Ncgn

" repeat and go back to beginnig
nmap . .`[

" exit terminal mode
tnoremap <Esc> <C-\><C-n>

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
" nnoremap <Leader>r :OverCommandLine <CR>:%s/
" substitute word under cursor on current line
" nnoremap <Leader>n :s/\<<C-r><C-w>\>//g<Left><Left>
" substitute word under cursor in whole document
" nnoremap <Leader>m :%s/\<<C-r><C-w>\>//g<Left><Left>

" toggle search highlight
nnoremap <leader>h :set hlsearch!<cr>
nnoremap <Space> :noh<cr>

" copy paste
" nmap <C-V> "+gP
" imap <C-V> <ESC><C-V>i
" vmap <C-C> "+y
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
nnoremap <M-S-k> :bnext<CR>
nnoremap <M-S-j> :bprev<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-t>c :tabclose<CR>

" buffer kill
nnoremap <leader>dd :bd<cr>

" allows backspace in insert mode
set backspace=start,indent,eol

" Toggle [i]nvisible characters
nnoremap <leader>i :set list!<CR>

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
nnoremap <silent> <C-j> :cnext<cr>
nnoremap <silent> <C-k> :cprev<cr>

" local list
nnoremap <silent> <leader>q :lopen<cr>
nnoremap <silent> <leader>j :lnext<cr>
nnoremap <silent> <leader>k :lprev<cr>

" set spell check on demand
nnoremap <silent> <F9> :set spell!<cr>
inoremap <silent> <F9> <C-O>:set spell!<cr>

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
  autocmd! FileType html imap <tab> <plug>(emmet-expand-abbr)
augroup END

"-------------------------------------------------------------------------------
" over.vim - powered up search & replace
"-------------------------------------------------------------------------------
nnoremap <leader>l :ls <CR> :b<space>

" set
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules,*/bower_components

"-------------------------------------------------------------------------------
" Ale (syntax checker)
"-------------------------------------------------------------------------------
" let g:ale_sign_column_always = 1
" nmap <silent> <F2> <Plug>(ale_previous_wrap)
" nmap <silent> <F3> <Plug>(ale_next_wrap)

"-------------------------------------------------------------------------------
" Git
"-------------------------------------------------------------------------------
let g:gitblame_date_format = '%r, (%d.%m.%Y %H:%M)'
" let g:minimap_width = 5
" let g:minimap_auto_start = 0
" let g:minimap_auto_start_win_enter = 1
" let g:minimap_git_colors = 1
" nnoremap <silent> <F4> :MinimapToggle<CR>

"-------------------------------------------------------------------------------
" Telescope
"-------------------------------------------------------------------------------

" Find files using Telescope command-line sugar.
" nnoremap <C-P> <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <C-Space> <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using lua functions
nnoremap <C-P> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <C-Space> <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fu <cmd>lua require('telescope.builtin').lsp_references<cr>
nnoremap <leader><Space> <cmd>lua require'telescope'.extensions.file_browser.file_browser({ path = require('telescope.utils').buffer_dir() })<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <C-_> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>

"-------------------------------------------------------------------------------
" nvim-tree
"-------------------------------------------------------------------------------
let g:nvim_tree_disable_window_picker = 1

nnoremap <silent> <F1> :NvimTreeToggle<CR>
nnoremap <silent> <leader>r :NvimTreeRefresh<CR>
nnoremap <silent> <leader>n :NvimTreeFindFile<CR>
nnoremap <silent> <F10> :NvimTreeFindFile<CR>

"-------------------------------------------------------------------------------
" fugitive.git
"-------------------------------------------------------------------------------
nmap <leader>gj :diffget //3<CR> 
nmap <leader>gf :diffget //2<CR> 
nmap <leader>gs :G<CR> 
 
"-------------------------------------------------------------------------------
" trouble
"-------------------------------------------------------------------------------
" nnoremap <leader>xx <cmd>TroubleToggle<cr>
" nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
" nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
" nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
" nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>

"-------------------------------------------------------------------------------
" LSP
"-------------------------------------------------------------------------------
" LSP config (the mappings used in the default file don't quite work right)
" nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> <C-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> <C-CR> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> K <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> [e <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
" nnoremap <silent> ]e <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" nnoremap <silent> <F2> <cmd>lua vim.lsp.buf.rename()<CR>
" nnoremap <silent> F2 <cmd>lua vim.lsp.buf.rename()<CR>

" auto-format
" autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

" nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
" vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
" nnoremap <silent><C-.> :Lspsaga code_action<CR>
" nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" nnoremap <silent> gs :Lspsaga signature_help<CR>
" nnoremap <silent> <F2> :Lspsaga rename<CR>
" nnoremap <silent> <F12> :Lspsaga preview_definition<CR>
" nnoremap <silent> gd :Lspsaga preview_definition<CR>
" nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
" nnoremap <silent><leader>cc <cmd>lua require 'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
" nnoremap <silent> ]e :Lspsaga diagnostic_jump_next<CR>
" nnoremap <silent> [e :Lspsaga diagnostic_jump_prev<CR>

