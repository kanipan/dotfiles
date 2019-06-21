imap <C-n> <Down>
imap <C-p> <Up>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-k> <Del>

set autoindent

set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2

set number

if expand("%:t") =~ ".*\.php"
  set noexpandtab
  set tabstop=4
  set shiftwidth=4
endif

hi Comment ctermfg=2
hi String  ctermfg=3

"ファイルを開いた時に最後にカーソルがあった場所に移動する
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

set backspace=indent,eol,start

" ヤンクした結果をクリップボードで保持する for Mac
set clipboard+=unnamed

" 検索結果のハイライトが邪魔な時に消す
nnoremap <C-@> :noh<CR>

" ctags で複数候補がある場合は一覧表示
nnoremap <C-]> g<C-]>

" coc プラグイン入れたらメッセージが出てきたので FAQ に従った
" https://github.com/neoclide/coc.nvim/wiki/F.A.Q#linting-is-slow
set updatetime=300

" for dein
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  let g:config_dir  = expand('~/.cache/dein/userconfig')
  let s:toml        = g:config_dir . '/plugins.toml'
  let s:lazy_toml   = g:config_dir . '/plugins_lazy.toml'

  " TOML 読み込み
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable
" end dein setting
