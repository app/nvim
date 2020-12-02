if has_key(plugs, 'nvim-toggle-terminal')
  nnoremap <silent> <C-z> :ToggleTerminal<Enter>
  tnoremap <silent> <C-z> <C-\><C-n>:ToggleTerminal<Enter>
  tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
endif
