" vim-plug plugins
call plug#begin('~/.vim/plugged')

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Kotlin
Plug 'udalov/kotlin-vim'

" Go
Plug 'fatih/vim-go'

" Javascript & Web dev
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'

" Others
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'

call plug#end()

" Configure airline theme
" let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_theme='onedark'
" let g:airline_theme='xtermlight'

filetype plugin indent on

" Configure tabbing
set tabstop=2 shiftwidth=2 expandtab

" Add relative line numbers
set number relativenumber

" Turn on syntax highlighting
syntax on
colorscheme onedark

" Enable autoindent
set autoindent

" Show matching braces
set showmatch

" Enable right margin
set cc=120
set textwidth=120 " Auto wrap text at 120 characters

" Toggle cursors for Konsole
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Auto-close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Keyboard shortcuts
map <C-n> :NERDTreeToggle<CR>

