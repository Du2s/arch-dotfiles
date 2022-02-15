set mouse=a
set encoding=utf-8
set number
set relativenumber
set noswapfile
set scrolloff=7

set tabstop=4

call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'

" color schemas
Plug 'morhetz/gruvbox'  " colorscheme gruvbox
Plug 'mhartington/oceanic-next'  " colorscheme OceanicNext
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'ayu-theme/ayu-vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

call plug#end()
colorscheme gruvbox
if (has('termguicolors'))
  set termguicolors
endif
