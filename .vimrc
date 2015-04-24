imap <C-n> <Down>
imap <C-p> <Up>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-k> <Del>
syntax on

set autoindent

set expandtab
set tabstop=2
set shiftwidth=2

if expand("%:t") =~ ".*\.php"
  set noexpandtab
  set tabstop=4
  set shiftwidth=4
endif

hi Comment ctermfg=2
