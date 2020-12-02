if has_key(plugs, 'vim-blade')
  " blade template engine file type detection
  autocmd BufNewFile,BufRead *.blade.php set filetype=blade
endif
