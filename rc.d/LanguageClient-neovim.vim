if has_key(plugs, 'LanguageClient-neovim')
 
  " LSP (Language Server Protocol) client setup.
  " Language server have to be installed in system.
  " cquery - c/cpp language server command
  " Use this if you have to debug/check server behavior
  " \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
  " \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
  let g:LanguageClient_serverCommands = {
      \ 'cpp': ['cquery'],
      \ 'c': ['cquery'],
      \ }
  let g:LanguageClient_loadSettings = 1
  let g:LanguageClient_settingsPath = fnamemodify($MYVIMRC,':h').'/settings.json'
  " Errors sign switched off since we using clang (via ale linter) for error detection
  let g:LanguageClient_diagnosticsSignsMax = 0 

  nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  " nnoremap <silent> gi :call LanguageClient#textDocument_implementation()<CR>
  nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
  nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

endif
