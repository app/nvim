if has_key(plugs, 'float-preview.nvim')
  " Do not need standart window any more :)
  set completeopt-=preview
  " Show free float window
  let g:float_preview#docked=0
endif
