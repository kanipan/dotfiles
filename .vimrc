imap <C-n> <Down>
imap <C-p> <Up>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-k> <Del>
syntax on

set autoindent

set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2

if expand("%:t") =~ ".*\.php"
  set noexpandtab
  set tabstop=4
  set shiftwidth=4
endif

hi Comment ctermfg=2

"ファイルを開いた時に最後にカーソルがあった場所に移動する
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END
