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
