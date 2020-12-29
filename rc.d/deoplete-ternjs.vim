if has_key(plugs, 'deoplete-ternjs')
  let g:deoplete#sources#ternjs#types = 1 " Shows data type hints
  let g:deoplete#sources#ternjs#docs = 1 " Shows docs extracted from comments
  let g:deoplete#sources#ternjs#case_insensitive = 1
  let g:deoplete#sources#ternjs#filetypes = ['javascript.jsx'] "Add extra filetypes
endif
