let mapleader=" "
set clipboard+=unnamedplus
" check remote sission
if exists("$SSH_TTY")
" remote clipboard access
" xclip have to be installed and X11 forwarding in sshd_conf switched on
" don't forget -X key for ssh
  vmap "+y :!xclip -f -sel clip
  map "+p :r!xclip -o -sel clip
endif
set cursorline
set nu rnu
set tabstop=2 | set shiftwidth=2 | set expandtab| set softtabstop=2| set list
set noshowmode

function! InstallRemotePlugin(info)
  UpdateRemotePlugins
endfunction
call plug#begin('$HOME/.config/nvim/plugged')
Plug 'dense-analysis/ale' "Asynchronous Lint Engine (syntastic replacement)
Plug 'jiangmiao/auto-pairs' " delimitMate replacement
" Plug 'gavocanov/vim-js-indent'
Plug 'Shougo/deoplete.nvim', {'do':function('InstallRemotePlugin')} " asynchronous autocompletion
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] } " deoplete for js
Plug 'pbogut/deoplete-padawan', { 'for': 'php' } " Don't forget install padawan command first
Plug 'tweekmonster/deoplete-clang2', { 'for': ['cpp', 'c'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy finder external tool
Plug 'junegunn/fzf.vim' " fuzzy finder vim commands
Plug 'ervandew/supertab' " Use tab for completeopt everywhere
Plug 'scrooloose/nerdcommenter' " toggle comments with 'cc' key press
Plug 'ternjs/tern_for_vim', { 'do': 'npm -g i tern', 'for': ['javascript', 'javascript.jsx']  }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'vim-airline/vim-airline' " visual decoration 
Plug 'vim-airline/vim-airline-themes' " visual decoration
" color themes
Plug 'lifepillar/vim-solarized8' 
Plug 'tomasiser/vim-code-dark'
Plug 'iCyMind/NeoSolarized' " needed for gvim/MacVim and truecolor support
Plug 'NLKNguyen/papercolor-theme' " Color theme with dark and light versions 

Plug 'airblade/vim-gitgutter' " git status marks for changed lines
Plug 'michaeljsmith/vim-indent-object' " select by indent
Plug 'SirVer/ultisnips' " snippets library
Plug 'honza/vim-snippets'
Plug 'kchmck/vim-coffee-script', { 'for':'coffee' }
Plug 'tomlion/vim-solidity', { 'for': ['solidity'] }
Plug 'app/vim-gitbranch' " single function - returns current git branch name
Plug 'app/vim-kiri', { 'for': 'kiri'} " experimental. You do not need it
Plug 'jwalton512/vim-blade', { 'for': 'blade'} " blade templates for Laravel
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'spacewander/openresty-vim', { 'for': ['nginx'] } " nginx syntax and completion support
Plug 'app/jsdoc-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'tpope/vim-liquid',{ 'for': 'liquid'} " Shopify templates syntax language
Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }

"Plug 'edkolev/promptline.vim' " Use it only for promptline file generation
call plug#end()

" Show/hide invisible symbols
nmap <leader>l :set list!<CR>:set cursorcolumn!<CR>
" Invisible symbols settings
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set nolist

" Colors settings for syntax highlighting
if &term!="xterm"
  set termguicolors " true colors on
  " set t_Co=256
  syntax enable
  set background=dark

  " colorscheme codedark
  colorscheme NeoSolarized
  " colorscheme PaperColor
  " colorscheme solarized8
  " colorscheme solarized8_flat
endif

"vim-airline show buffers on window top
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Show git branch name in status line
try
  if gitbranch#name()!=""
    let g:airline_section_c = '%{g:airline_symbols.branch} %{gitbranch#name()} %{g:airline_left_alt_sep} %{@%}'
  endif
catch
  echo "It seems to me 'vim-gitbranch' plugin missed. Install it and you'll see git brand name in status line"
endtry

let g:deoplete#enable_at_startup = 1
" Please show snippets with short name in complition list
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
call deoplete#custom#source('ultisnips', 'min_pattern_length', 1)
" Switch off padawan's logfile
"let g:deoplete#sources#padawan#log_file = ''

" Close window with documentation after complition finished
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
let g:deoplete#sources#ternjs#types = 1 " Shows data type hints
let g:deoplete#sources#ternjs#docs = 1 " Shows docs extracted from comments
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#filetypes = ['javascript.jsx']
" let g:deoplete#disable_auto_complete = 1
set completeopt=longest,menuone,preview
"let g:deoplete#sources = {}
" let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:tern_show_argument_hints = 'on_hold' " waits befor showing
let g:tern_show_signature_in_pum = 1 " Show function signature hint
let g:UltiSnipsExpandTrigger="<C-j>"
" Tab complition navigation from top to bottom not backword
let g:SuperTabDefaultCompletionType = "<c-n>"

" Let plugins show effects after 500ms, not 4s
set updatetime=500
set splitbelow

autocmd FileType cpp set tabstop=8 | set shiftwidth=8 | set noexpandtab | set softtabstop=8

"{{{ FZF setup for open file with various search strategies 
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -U -l -g ""'
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_buffers_jump = 1

function! SearchWordWithAg()
  execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Ag' selection
endfunction
" Up search for .git folder
fun! s:fzf_root()
  let path = finddir(".git", expand("%:p:h").";")
  return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
endfun
" Open file with fzf search from current folder
nnoremap <silent> <C-p> :Files<CR>
" Open file with fzf search from .git place folder
nnoremap <silent> <C-o> :exe 'Files ' . <SID>fzf_root()<CR>
nnoremap <silent> <leader>p :exe 'Files ' . <SID>fzf_root()<CR>
" Search word under cursor
nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>

nnoremap <silent> <C-f> :Lines<CR>
" Search pattern inside files 
nnoremap <silent> <leader>f :Ag<CR> 
" nnoremap <silent> F :Ag<CR> 
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <leader>b :Buffers<CR>
" Search in most recently used
nnoremap <silent> <C-m> :History<CR>
"}}}

" Restore cursor position in reopened file
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" jsdoc plugin setup
let g:jsdoc_enable_es6=1
let g:jsdoc_input_description=1

source $HOME/.config/nvim/rc.d/myshortcuts.vim
source $HOME/.config/nvim/rc.d/fold-comments.vim

" Used when you run 'PromptLineSnapshot' command
"let g:promptline_preset = {
        "\'a' : [ promptline#slices#host() ],
        "\'b' : [ promptline#slices#user() ],
        "\'c' : [ promptline#slices#cwd() ],
        "\'y' : [ promptline#slices#vcs_branch() ],
        "\'warn' : [ promptline#slices#last_exit_code() ]}
"let g:ale_sign_column_always = 1
let g:ale_fixers = { 'html': ['tidy'], 'javascript': ['eslint'],'javascript.jsx': ['eslint'] }
let g:ale_linter_aliases = {'html': ['html', 'javascript']}
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'javascript.jsx': ['eslint'],
\   'jsx': ['eslint'],
\   'html': ['eslint'],
\   'cpp': ['clang'],
\}

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Auto fix command 
command Afix ALEFix

" blade template engine file type detection
autocmd BufNewFile,BufRead *.blade.php set filetype=blade

" Slim cursor shape in Insert mode
" set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
set guicursor=n-v-c:hor20-Cursor/lCursor-blinkoff400-blinkon250,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
" Restore terminal cursor shape on exit. See :help guicursor
au VimLeave *	set guicursor=n:ver25,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor

" LSP (Language Server Protocol) client setup.
" Language server have to be installed in system. 
" cquery - c/cpp language server command
" Use this if you have to debug/check server behavior
" \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
" \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['cquery'],
    \ 'c': ['cquery'],
    \ } 
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = fnamemodify($MYVIMRC,':h').'/settings.json'
" Errors sign switched off since we using clang (via ale linter) for error detection
let g:LanguageClient_diagnosticsSignsMax = 0 

nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> gi :call LanguageClient#textDocument_implementation()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

autocmd BufNewFile,BufRead *.liquid set filetype=javascript
let g:NERDCustomDelimiters = { 'javascript.jsx': { 'left': '//', 'right': '', 'leftAlt': '{/*','rightAlt': '*/}' } }
