if has_key(plugs, 'ale')
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)
  " Auto fix command
  command Afix ALEFix

  "let g:ale_sign_column_always = 1
  let g:ale_fixers = { 'html': ['tidy'], 'javascript': ['eslint'],'javascript.jsx': ['eslint'] }
  let g:ale_linter_aliases = {'html': ['html', 'javascript']}
  let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'javascript.jsx': ['eslint'],
  \   'jsx': ['eslint'],
  \   'html': ['eslint'],
  \   'cpp': ['clang'],
  \}
endif
