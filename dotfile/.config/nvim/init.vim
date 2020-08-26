"auto change current directory when execute ':vsp',':e' ,etc..
set runtimepath^=~/.config/nvim
let &packpath = &runtimepath
set autochdir
source ./vimrc
