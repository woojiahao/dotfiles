" vim-plug plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

let g:airline_theme='base16_gruvbox_dark_hard'

filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
syntax on

" Toggle cursors for Konsole
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

