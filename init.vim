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
set nu
set tabstop=2 | set shiftwidth=2 | set expandtab| set softtabstop=2| set list
set noshowmode

function! InstallRemotePlugin(info)
  UpdateRemotePlugins
endfunction
call plug#begin('$HOME/.config/nvim/plugged')
"Plug 'scrooloose/syntastic'
Plug 'w0rp/ale' " syntacsic replacement
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs' " delimitMate replacement
Plug 'gavocanov/vim-js-indent'
Plug 'Shougo/deoplete.nvim', {'do':function('InstallRemotePlugin')}
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pbogut/deoplete-padawan', { 'for': 'php' } " Don't forget install padawan command first
Plug 'tweekmonster/deoplete-clang2', { 'for': ['cpp', 'c'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': ['javascript', 'javascript.jsx']  }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'michaeljsmith/vim-indent-object'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'kchmck/vim-coffee-script', { 'for':'coffee' }
Plug 'tomlion/vim-solidity', { 'for': ['solidity'] }
Plug 'app/vim-gitbranch'
Plug 'app/vim-kiri', { 'for': 'kiri'}
Plug 'jwalton512/vim-blade'
Plug 'krisajenkins/vim-projectlocal'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
"Plug 'edkolev/promptline.vim' " Use it only for promptline file generation
call plug#end()

" Show/hide invisible symbols
nmap <leader>l :set list!<CR>:set cursorcolumn!<CR>
" Invisible symbols settings
set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set nolist

" Colors settings
if &term!="xterm"
  syntax enable
  set background=dark
  set t_Co=16
  "set t_Co=256
  let g:solarized_termcolors=16
  "let g:solarized_termcolors=256
  colorscheme solarized
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
" let g:deoplete#disable_auto_complete = 1
set completeopt=longest,menuone,preview
"let g:deoplete#sources = {}
"let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
let g:tern_show_argument_hints = 'on_hold' " waits befor showing
let g:tern_show_signature_in_pum = 1 " Show function signature hint
"autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
" Tab complition navigation from top to bottom not backword
let g:SuperTabDefaultCompletionType = "<c-n>"

"inoremap <expr><TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

"Competion selection from top to bottom. Default is from bottom to top
"let g:SuperTabDefaultCompletionType = "<c-n>"

" Let plugins show effects after 500ms, not 4s
set updatetime=500
set splitbelow

"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
"augroup omnifuncs
  "autocmd!
  "autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  "autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  "autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"augroup end


"{{{ Syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1 " auto open error list if errors found
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_coffee_checkers = ['coffeelint', 'coffee']
" installed by
" sudo gem install rake rspec bundler pg_query && sudo gem install sqlint
let g:syntastic_sql_checkers = ['sqlint']

" show any linting errors immediately
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

let g:syntastic_warning_symbol = "»"
let g:syntastic_error_symbol = "»"
" status line format
let g:syntastic_stl_format = "%E{E:%fe(%e) }%W{W:%fw(%w)}"
" }}}

"autocmd FileType coffee set tabstop=2 | set shiftwidth=2 | set expandtab| set softtabstop=2| set list
"autocmd FileType javascript set tabstop=2 | set shiftwidth=2 | set expandtab| set softtabstop=2| set list
"autocmd FileType gt-script set tabstop=2 | set shiftwidth=2 | set expandtab| set softtabstop=2| set list
"autocmd FileType php set tabstop=2 | set shiftwidth=2 | set expandtab| set softtabstop=2| set list
" autocmd FileType cpp set tabstop=4 | set shiftwidth=4 | set noexpandtab | set softtabstop=4
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

" Used when you run 'PromptLineSnapshot' command
"let g:promptline_preset = {
        "\'a' : [ promptline#slices#host() ],
        "\'b' : [ promptline#slices#user() ],
        "\'c' : [ promptline#slices#cwd() ],
        "\'y' : [ promptline#slices#vcs_branch() ],
        "\'warn' : [ promptline#slices#last_exit_code() ]}
"let g:ale_sign_column_always = 1
let g:ale_fixers = { 'javascript': ['eslint']}
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'cpp': ['clang'],
\}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Auto fix command 
command Afix ALEFix

" blade template engine file type detection
autocmd BufNewFile,BufRead *.blade.php set filetype=blade

" Slim cursor shape in Insert mode
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
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

" At the moment there is a bug with snippets expantion
" https://github.com/autozimu/LanguageClient-neovim/issues/379
" Comment if fixed
" Remove LanguageClient from completion soureces
call deoplete#custom#option('ignore_sources', {'_': ['LanguageClient']})

