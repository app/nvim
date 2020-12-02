" Plug 'app/jsdoc-syntax.vim' reqired
if has_key(plugs, 'jsdoc-syntax.vim')
  set foldmethod=syntax "syntax highlighting items specify folds
  " set foldcolumn=1 "defines 1 col at window left, to indicate folding
  " let javaScript_fold=1 "activate folding by JS syntax
  set foldlevelstart=99 "start file with all folds opened
endif
