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

" Elixir
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elixir-editors/vim-elixir'

" Others
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tomtom/tcomment_vim'
Plug 'mhinz/vim-startify'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'name': 'dracula' }

" Java
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'

call plug#end()


filetype plugin indent on

" Configure tabbing
set tabstop=2 shiftwidth=2 expandtab

" Add relative line numbers
set number relativenumber

" Configure airline theme
" let g:airline_theme='onehalflight'

set nocompatible

" Configure theme
if has('termguicolors')
  set termguicolors
endif
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark
syntax on
colorscheme dracula

" Enable autoindent
set autoindent

" Show matching braces
set showmatch

" Enable right margin
set cc=120
set textwidth=120 " Auto wrap text at 120 characters

" Toggle cursors for Konsole
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Auto-close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

inoremap jk <Esc>

" Keyboard shortcuts
map <C-n> :NERDTreeToggle<CR>

let g:user_emmet_leader_key=','

set nofoldenable

