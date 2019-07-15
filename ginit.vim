if exists('g:GtkGuiLoaded')
  " call rpcnotify(1, 'Gui', 'Font', 'DejaVu Sans Mono 12')
  call rpcnotify(1, 'Gui', 'Font', 'Fira Code 12')
  set termguicolors
  colorscheme NeoSolarized
  let g:GuiInternalClipboard = 1
endif
