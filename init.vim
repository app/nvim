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

function! InstallRemotePlugin(info)
  UpdateRemotePlugins
endfunction
call plug#begin('$HOME/.config/nvim/plugged')
Plug 'scrooloose/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', {'do':function('InstallRemotePlugin')}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'benekastah/neomake'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdcommenter'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': ['javascript', 'javascript.jsx']  }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'michaeljsmith/vim-indent-object'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'kchmck/vim-coffee-script', {'for':'coffee'}
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

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
" let g:deoplete#disable_auto_complete = 1
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
"autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
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
" use jshint
" sudo npm install jshint -g
" jshint should be installed and available in your command line 
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = ['jshint']
" installed by
" sudo gem install rake rspec bundler pg_query && sudo gem install sqlint
let g:syntastic_sql_checkers = ['sqlint']

" show any linting errors immediately
let g:syntastic_check_on_open = 1

let g:syntastic_warning_symbol = "»"
let g:syntastic_error_symbol = "»"
" }}}


" {{{ neomake options
"autocmd! BufWritePost * Neomake
"let g:neomake_list_height = 5
"let g:neomake_serialize = 1
"let g:neomake_verbose = 0
"let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_message_sign = {
      "\ 'text': '»',
      "\ 'texthl': 'DiffText',
      "\ }
"let g:neomake_informational_sign = {
      "\ 'text': '»',
      "\ 'texthl': 'DiffAdd',
      "\ }
"let g:neomake_warning_sign = {
      "\ 'text': "\u266a", 
      "\ 'texthl': 'DiffChange',
      "\ }
"let g:neomake_error_sign = {
      "\ 'text': "»",
      "\ 'texthl': 'DiffDelete',
      "\ }

" }}}


"autocmd FileType coffee set tabstop=2 | set shiftwidth=2 | set expandtab| set softtabstop=2| set list
"autocmd FileType javascript set tabstop=2 | set shiftwidth=2 | set expandtab| set softtabstop=2| set list
"autocmd FileType gt-script set tabstop=2 | set shiftwidth=2 | set expandtab| set softtabstop=2| set list
"autocmd FileType php set tabstop=2 | set shiftwidth=2 | set expandtab| set softtabstop=2| set list

"{{{ FZF setup
"let g:fzf_layout = { 'down': '~40%' }
let g:fzf_layout = { 'window': 'enew' }
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

nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>

nnoremap <silent> <C-f> :Lines<CR>
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
