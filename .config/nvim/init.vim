" set runtimepath^=~/.vim runtimepath+=~/.vim/after    
" let &packpath = &runtimepath
" source ~/.vimrc

""" START Plugin Import

call plug#begin('~/.vim/plugged')
  " Setup TreeSitter
  Plug 'nvim-treesitter/nvim-treesitter'

  " Status line
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'         " Status line icons

  " NERDTree Alternative
  Plug 'kyazdani42/nvim-tree.lua'

  " Helper
  Plug 'folke/which-key.nvim'                 " Which key display
  Plug 'sudormrfbin/cheatsheet.nvim'          " Display cheatsheet for keybindings
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " Quality of life
  Plug 'akinsho/nvim-toggleterm.lua'          " Floating terminals
  Plug 'nvim-telescope/telescope.nvim'        " Fuzzy searching 
  Plug 'lukas-reineke/indent-blankline.nvim'  " Indentation guides
  Plug 'dense-analysis/ale'                   " Syntax checking and semantic errors
  Plug 'tomtom/tcomment_vim'                  " Toggle comment
  Plug 'mhinz/vim-startify'                   " Display startup screen
  Plug 'airblade/vim-gitgutter'               " Display Git status in gutter
  Plug 'drewtempelmeyer/palenight.vim'        " Palenight theme

  " Development
  Plug 'windwp/nvim-ts-autotag'                     " Auto-edit tags (consider using nvim-surround instead)
  Plug 'TimUntersberger/neogit'                     " Git
  Plug 'plasticboy/vim-markdown'                    " Markdown
  Plug 'ellisonleao/glow.nvim'                      " Markdown Preview
  Plug 'godlygeek/tabular'                          " Table formatting for Markdown
  Plug 'sbdchd/neoformat'                           " Auto-format
  Plug 'williamboman/mason.nvim'                    " Install LSP bundles
  Plug 'neoclide/coc.nvim', {'branch': 'release'}   " CoC
call plug#end()

""" END Plugin Import

""" START Plugin Configurations

" Markdown
set nofoldenable

""" END Plugin Configurations

filetype plugin indent on

set tabstop=2 shiftwidth=2 expandtab

set number relativenumber

set nocompatible

if has('termguicolors')
  set termguicolors
endif

set autoindent

set showmatch

" Set right margin and auto-wrap to 120 characters
set cc=120
set textwidth=120

" Use block cursor in iTerm 2
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Auto-close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>0
inoremap {;<CR> {<CR>};<ESC>0

inoremap jk <Esc>

""" START Keyboard shortcuts
" TODO Add one to toggle NerdTree

""" END Keyboard shortcuts

let g:user_emmet_leader=','

