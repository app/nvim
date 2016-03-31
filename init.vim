let mapleader=" "
set clipboard+=unnamedplus
set cursorline
set nu

function! InstallRemotePlugin(info)
  UpdateRemotePlugins
endfunction
call plug#begin('$HOME/.config/nvim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', {'do':function('InstallRemotePlugin')}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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



autocmd FileType coffee set tabstop=2 | set shiftwidth=2 | set expandtab| set softtabstop=2| set list
set listchars=tab:\|.,trail:.
autocmd FileType javascript set tabstop=2 | set shiftwidth=2 | set expandtab| set softtabstop=2| set list
set listchars=tab:\|.,trail:.

autocmd FileType gt-script set tabstop=2 | set shiftwidth=2 | set expandtab| set softtabstop=2| set list
set listchars=tab:\|.,trail:.

autocmd FileType php set tabstop=2 | set shiftwidth=2 

"{{{ FZF setup
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_buffers_jump = 1

" Open buffer
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction
function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <C-b> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" Search in most recently used
command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

" Search line in buffer
function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf' keys[0]
  exec keys[1]
  normal! ^zz
endfunction
function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction
command! FZFLines call fzf#run({
\   'source':  <sid>buffer_lines(),
\   'sink':    function('<sid>line_handler'),
\   'options': '--extended --nth=3..',
\   'down':    '60%'
\})

nmap <C-p> :FZF<CR>
nmap <C-m> :FZFMru<CR>
nmap <C-f> :FZFLines<CR>
"}}}

source $HOME/.config/nvim/rc.d/myshortcuts.vim
