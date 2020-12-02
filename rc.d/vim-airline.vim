if has_key(plugs, 'vim-airline')
  " vim-airline show buffers on window top
  let g:airline#extensions#tabline#enabled = 1

  let g:airline_powerline_fonts = 1
  " let g:tmuxline_powerline_separators = 0

  " Show git branch name in status line
  try
    if gitbranch#name()!=""
      let g:airline_section_c = '%{g:airline_symbols.branch} %{gitbranch#name()} %{g:airline_left_alt_sep} %{@%}'
    endif
  catch
    echo "Warning: It seems to me 'vim-gitbranch' plugin missed. Install it and you'll see git brand name in status line"
  endtry
endif
