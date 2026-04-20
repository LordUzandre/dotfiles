set number
set relativenumber

syntax enable
set termguicolors
colorscheme monokai

"" Cursor: bar in insert mode
let &t_SI = "\e[6 q"
"" Cursor: block in nomral mode
let &t_EI = "\e[2 q"

"" Leave insert mode after 5s inactivity
set updatetime=5000
autocmd CursorHoldI * stopinsert

call plug#begin()
" The main LSP client
Plug 'prabirshrestha/vim-lsp'
" Auto-configuration and installer for LSP servers
" Plug 'mattn/vim-lsp-settings'
" (Optional) Autocompletion support
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()


