" FZF setup for open file with various search strategies
if has_key(plugs, 'fzf')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -U -l -g ""'
  let $FZF_DEFAULT_OPTS = '--layout=reverse'
  let $BAT_THEME = 'Solarized (dark)'
  let g:fzf_layout = { 'window': 'enew' }
  let g:fzf_layout = { 'down': '~60%' }
  let g:fzf_buffers_jump = 1

  command! -bang -nargs=* GGrep
    \ call fzf#vim#grep(
    \   'git grep --line-number '.shellescape(<q-args>), 0,
    \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

  function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
  endfunction

  function! SearchWordWithGitGrep()
    execute 'GGrep' expand('<cword>')
  endfunction

  function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
  endfunction

  function! SearchVisualSelectionWithGitGrep() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'GGrep' selection
  endfunction
  " Up search for .git folder
  fun! s:fzf_root()
    let path = finddir(".git", expand("%:p:h").";")
    return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
  endfun
  " Open file with fzf search from current folder
  nnoremap <silent> <C-p> :Files<CR>
  " Open files listed with git ls-files command
  nnoremap <silent> <C-o> :GFiles<CR>
  " Open file with fzf search from .git place folder
  nnoremap <silent> <leader>p :exe 'Files ' . <SID>fzf_root()<CR>
  " Search word under cursor
  nnoremap <silent> K :call SearchWordWithGitGrep()<CR>
  " nnoremap <silent> K :call SearchWordWithAg()<CR>
  vnoremap <silent> K :call SearchVisualSelectionWithGitGrep()<CR>
  " vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>

  nnoremap <silent> <C-f> :Lines<CR>
  " Search pattern inside files
  nnoremap <silent> <leader>f :Ag<CR>
  " nnoremap <silent> F :Ag<CR>
  nnoremap <silent> <C-b> :Buffers<CR>
  nnoremap <silent> <leader>b :Buffers<CR>
  " Search in most recently used
  nnoremap <silent> <C-m> :History<CR>
endif
