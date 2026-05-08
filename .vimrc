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
" clangd
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Auto-configuration and installer for LSP servers
" Plug 'mattn/vim-lsp-settings'
" (Optional) Autocompletion support
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

nnoremap vv ^vg_
nnoremap 0 ^
nnoremap ^ 0
nnoremap gg g0
nnoremap G G$

" normal mode (covers all operations)
nnoremap d "_d
" Visual mode
vnoremap d "_d
nnoremap D "_D
" optional
nnoremap x "_x

" Normal mode (covers all operations)
nnoremap y "+y
" Visual mode
vnoremap y "+y
nnoremap Y "+Y
