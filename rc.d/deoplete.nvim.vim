if has_key(plugs, 'deoplete.nvim')
  try 
    let g:deoplete#enable_at_startup = 1
    " Please show snippets with short name in complition list
    call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])
    call deoplete#custom#source('ultisnips', 'min_pattern_length', 1)
    " Switch off padawan's logfile
    "let g:deoplete#sources#padawan#log_file = ''

    " Close window with documentation after complition finished
    " Do not need for float preview
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

    call deoplete#custom#var('omni', 'functions', {
    \ 'javascript': ['javascriptcomplete#CompleteJS']
    \ })
    call deoplete#custom#var('omni', 'input_patterns', {
    \ 'javascript': '[^. *\t]\.\w*',
    \ })

    " let g:deoplete#disable_auto_complete = 1
    set completeopt=longest,menuone,preview
    "let g:deoplete#sources = {}
    " let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']

    " Workaround. See this issue https://github.com/carlitux/deoplete-ternjs/issues/88
    call deoplete#custom#option('num_processes', 4)
  catch
    echo "Warning: Please check deoplete.nvim plugin installed"
  endtry
endif
