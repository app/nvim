" Russian keyboard layous support
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz


" Add new line below in Insert mode
imap <C-o> <esc>o

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :w<CR>
vnoremap <C-S> <C-C>:w<CR>
inoremap <C-S> <Esc>:w<CR>
" Quit from vim
noremap <C-Q> :q<CR>
inoremap <C-Q> <C-O>:q<CR>
" Close curent buffer
noremap <silent> <Leader>q :bd<CR>

""" NerdCommenter setup
" Toggle comments by pressing cc while in normal mode
" map cc <leader>c<space>
map cc <plug>NERDCommenterToggle
map cx :call AltComment()<CR>
map <leader>cc :call AltComment()<CR>
" Cyrillic 'сс' :)
map сс <leader>c<space>
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
function! AltComment()
  :execute "normal \<plug>NERDCommenterAltDelims"
  :execute "normal \<plug>NERDCommenterToggle"
  :execute "normal \<plug>NERDCommenterAltDelims"
endfunction



" Select all
nmap <C-a> ggVG

" Skipto undescore symbol
nmap <leader>w f_
" Generate doc comments
autocmd FileType javascript nmap <silent> <leader>d :JsDoc<CR>
autocmd FileType javascript nmap <silent> cd :JsDoc<CR>

" Search selected text
vnorem // y/<c-r>"<cr>
vnorem * y/<c-r>"<cr>
" Search and replace selected text
vmap <Leader>r "sy:%s/<C-R>=substitute(@s,"\n",'\\n','g')<CR>/
vmap <C-h> "sy:%s/<C-R>=substitute(@s,"\n",'\\n','g')<CR>/
vmap /r "sy:%s/<C-R>=substitute(@s,"\n",'\\n','g')<CR>/

" Match pair setup
set mps+=<:>
au FileType c,cpp,java,javascript set mps+==:;

" Wrapped line movement
noremap k gk
vnoremap k gk
noremap j gj
vnoremap j gj

" FZF git files
nmap gf :GFiles<CR>
nmap gs :GFiles?<CR>

" Highlight off
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" Tern commands map
nmap <leader>td :TernDef<CR>
nmap <leader>tr :TernRename<CR>

" next/prev error navigation mapping
nmap <leader>n :lnext<CR>
nmap <leader>p :lprevious<CR>

" build in terminal  go to normal mode
" tnoremap <Esc> <C-\><C-n>

" Split windows navigation
" To use `ALT+{h,j,k,l}` to navigate windows from any mode:
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Jumps between cpp/h files
nnoremap <Leader>gc :e %<.c<CR>
nnoremap <Leader>gp :e %<.cpp<CR>
nnoremap <Leader>gh :e %<.h<CR>

" Replace selection with default buffer without replacing buffer
vnoremap <leader>p "_dP

" format selected code
nmap <leader>a :Neoformat<CR>
nmap <leader>a :Neoformat<CR>
