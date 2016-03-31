"set nocompatible
"syntax on
"filetype plugin indent on
let mapleader=" "
set clipboard+=unnamedplus
set cursorline

call plug#begin('$HOME/.config/nvim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim'
Plug 'benekastah/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'michaeljsmith/vim-indent-object'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
call plug#end()

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
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" deoplete tab-complete
"inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" ,<Tab> for regular tab
"inoremap <Leader><Tab> <Space><Space>
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

autocmd! BufWritePost * Neomake


" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :w<CR>
vnoremap <C-S> <C-C>:w<CR>
inoremap <C-S> <Esc>:w<CR>
" Quit from vim
noremap <C-Q> :q<CR>
inoremap <C-Q> <C-O>:q<CR>
" Close curent buffer
noremap <silent> <Leader>q :bd<CR>

" Toggle comments by pressing cc while in normal mode
map cc <leader>c<space>
" Cyrillic 'сс' :)
map сс <leader>c<space>


" {{{ neomake options
let g:neomake_list_height = 5
let g:neomake_serialize = 1
let g:neomake_verbose = 0
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_message_sign = {
        \ 'text': '»',
        \ 'texthl': 'DiffText',
        \ }
let g:neomake_informational_sign = {
        \ 'text': '»',
        \ 'texthl': 'DiffAdd',
        \ }
let g:neomake_warning_sign = {
  \ 'text': "\u266a", 
  \ 'texthl': 'DiffChange',
  \ }
let g:neomake_error_sign = {
  \ 'text': "»",
  \ 'texthl': 'DiffDelete',
  \ }

" }}}
