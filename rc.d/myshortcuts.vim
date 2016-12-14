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

" Toggle comments by pressing cc while in normal mode
map cc <leader>c<space>
" Cyrillic 'сс' :)
map сс <leader>c<space>

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
