set nocompatible

" Pathogen stuff, for plugins
call pathogen#infect()
call pathogen#helptags()

if has("autocmd")
	filetype on
	filetype plugin on
    filetype indent on
endif

"language 'pl_PL.UTF-8'

" auto completion
"set omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript set omnifunc=tern#Complete
" autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

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


set hidden          " allows to change buffer without saving file
set nobackup        " backup 
set noswapfile      " swap
set nowb
set encoding=utf-8  " encoding
set ttyfast         " fast scrolling
set history=700     " history
set wildmenu        " Better command completion

au VimResized * :wincmd =

" Leader
let mapleader = ","
let maplocalleader = ","

" mouse
set mouse=a
set bs=2


" APPEARANCE & UI --------------------------------------------------------------

"window size
" if has('win32') && has('gui_running')
"     set lines=50 columns=200
" endif

set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮
set linebreak
let &showbreak='↪ '
set linespace=2
set cmdheight=1         " Height of the command bar
set background=dark
set lazyredraw

" openning new splits
set splitbelow
set splitright
set cursorline

" Font
if has('win32')
    set guifont=Powerline_Consolas:h10:cANSI
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
colorscheme hybrid

" KEYMAPS & COMMANDS -----------------------------------------------------------

" quick escape
imap jj <Esc>

" CDC = Change to Directory of Current file
" command CDC cd %:p:h

" sane regexes
nnoremap / /\v
vnoremap / /\v

" nnoremap <tab> %

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

" tabs management
nnoremap <A-k> :tabnext<CR>
nnoremap <A-j> :tabprevious<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-t>c :tabclose<CR>

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

" vimux - running test
map <leader>rt :call RunTests()<CR>
map <leader>rl :VimuxRunLastCommand<CR>


" SEARCH OPTIONS ----------------------------------------------------------------

set hlsearch    " highlight search
set incsearch   " incremental search, don't have to type whole word
set ignorecase  " ignore casing when searching
set smartcase   " don't ignore casing when at least one letter is upper-case
set magic       " magic for regular expresion
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

set scrolloff=3 " at least 'n' number of lines at the top/bottom of the screen
set wildmode=longest,list   " file name completion
set nowrap                  " do not wrap lines

" pasting - set paste or set nopaste

" whitespace controll, autoindent has to be last one
"set noexpandtab
set showmatch
set ts=4
set sw=4
set sts=4
set smarttab
" set autoindent
"set textwidth=80
set expandtab


" PLUGINS --------------------------------------------------------------------

" TernJS (javascript intelligence engine)
let g:tern_show_argument_hints='on_hold'
let g:tern_request_timeout=3
let g:tern_map_prefix="<leader>"
let g:tern_map_keys=1

" Airline (replacement for Powerline - windows status, Obvious Mode replacement)
set laststatus=2
let g:airline_powerline_fonts=1
let g:bufferline_echo=0
let g:airline_theme="dark"

" NERDTree
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=36

" Syntastic
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['js', 'php'], 'passive_filetypes': [] }
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_open = 1
let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'

" EasyMotion
let g:EasyMotion_leader_key = '<Leader>'
let g:EasyMotion_leader_key = '<leader>'

" Number Toggle - relative numbers on sidebar
" <C-n>

" Unite (CtrlP alternative)
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10
let g:unite_source_file_mru_limit = 100
let g:unite_source_file_ignore_pattern = 
            \'^\%(/\|\a\+:/\)$\|\~$\|\.\%(o|exe|dll|bak|sw[po]\)$'

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

call unite#custom_source('buffer,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ 'tmp/',
      \ '.sass-cache',
      \ ], '\|'))

" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap <space> [unite]

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
    let b:SuperTabDisabled=1
    nnoremap <C-p> :Unite -buffer-name=files -start-insert file_rec/async file<cr>
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
    imap <silent><buffer><expr> <C-s> unite#do_action('split')
    imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
    imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
    nnoremap [unite]d :Unite -buffer-name=file -start-insert file_rec/async file<cr>
    nnoremap [unite]/ :Unite -buffer-name=search -start-insert grep:.<cr>
    nnoremap [unite]s :Unite -buffer-name=buffer -start-insert buffer<cr>
    nnoremap [unite]r :Unite -buffer-name=recent -start-insert file_mru<cr>
    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" Sparkup - gives zen coding - shortcut is Ctrl + E

set completeopt+=preview

" neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
inoremap <expr><C-g> neocomplcache#undo_completion()
" inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y> neocomplcache#close_popup()
" inoremap <expr><C-e> neocomplcache#cancel_popup()

" UltiSnippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsListSnippets="<c-m>"

" Emmet
let g:user_emmet_expandabbr_key='<c-h>'

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


" FUNCTIONS ------------------------------------------------------------------

function! RunTests()
    let ft = &filetype
    if ft == 'javascript'
        :call VimuxRunCommand("clear; karma run")
    endif
endfunction


syntax on
