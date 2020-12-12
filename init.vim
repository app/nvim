if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'dense-analysis/ale' "Asynchronous Lint Engine (syntastic replacement)
  Plug 'jiangmiao/auto-pairs' " delimitMate replacement
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " asynchronous autocompletion
  Plug 'ncm2/float-preview.nvim', " Preview window wihout current line shift :) Will be deprecated in nvim 5.0?
  Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] } " deoplete for js
  " Plug 'pbogut/deoplete-padawan', { 'for': 'php' } " Don't forget install padawan command first
  Plug 'tweekmonster/deoplete-clang2', { 'for': ['cpp', 'c'] }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy finder external tool
  Plug 'junegunn/fzf.vim' " fuzzy finder vim commands
  Plug 'ervandew/supertab' " Use tab for completeopt everywhere
  Plug 'scrooloose/nerdcommenter' " toggle comments with 'cc' key press
  Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] } " JavaScript Parameter Complete
  Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'vim-airline/vim-airline' " visual decoration 
  Plug 'vim-airline/vim-airline-themes' " visual decoration
  Plug 'overcache/NeoSolarized' " color scheme
  Plug 'airblade/vim-gitgutter' " git status marks for changed lines
  Plug 'michaeljsmith/vim-indent-object' " select by indent
  Plug 'SirVer/ultisnips' " snippets library
  Plug 'honza/vim-snippets'
  Plug 'kchmck/vim-coffee-script', { 'for':'coffee' }
  Plug 'tomlion/vim-solidity', { 'for': ['solidity'] }
  Plug 'app/vim-gitbranch' " single function - returns current git branch name
  Plug 'app/vim-kiri', { 'for': 'kiri'} " experimental. You do not need it
  Plug 'jwalton512/vim-blade', { 'for': 'blade'} " blade templates for Laravel
  Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
  Plug 'spacewander/openresty-vim', { 'for': ['nginx'] } " nginx syntax and completion support
  Plug 'app/jsdoc-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'tpope/vim-liquid',{ 'for': 'liquid'} " Shopify templates syntax language
  Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] }
  Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript'] }
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] } " javascript highliging and indentation
  Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] } " jsx/typesctipt highliging and indentation
  Plug 'digitaltoad/vim-pug', { 'for': ['pug'] } " Pug syntax highliging
  Plug 'caenrique/nvim-toggle-terminal'
  Plug 'jparise/vim-graphql'

  " Plug 'edkolev/promptline.vim' " Use it only for promptline file generation
  " Plug 'edkolev/tmuxline.vim' " Use it only for tmuxline file generation
call plug#end()

map <Space> <Leader>
set clipboard+=unnamedplus " use system clipboard
set cursorline " highliging cursorline

set number " show line numbers
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber " relative numbers for Normal mode
autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber " absolute line numbers for Insert mode

set tabstop=2 | set shiftwidth=2 | set expandtab| set softtabstop=2| set list
set noshowmode " do not show vim mode in status line
set undofile " store undo history in file permanently

" Colors settings for syntax highlighting
syntax enable
set background=dark
if &term!="xterm"
  set termguicolors " true colors on
  try
    colorscheme NeoSolarized
  catch
    echo "Warning: Please check NeoSolarized plugin installed"
  endtry
endif

set updatetime=500 " Let plugins show effects after 500ms, not 4s
set splitbelow " new window will appears below current window

autocmd FileType cpp set tabstop=8 | set shiftwidth=8 | set noexpandtab | set softtabstop=8

" Restore cursor position in reopened file
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" Slim cursor shape in Insert mode
set guicursor=n-v-c:hor20-Cursor/lCursor-blinkoff400-blinkon250,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
" Restore terminal cursor shape on exit. See :help guicursor
au VimLeave *	set guicursor=n:ver25,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor

autocmd BufNewFile,BufRead *.liquid set filetype=javascript
runtime! rc.d/*.vim
