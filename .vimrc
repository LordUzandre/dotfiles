if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'sickill/vim-monokai'
" Kärnan för LSP (lättviktig)
Plug 'prabirshrestha/vim-lsp'
" Gör det superenkelt att installera LSP-servrar (t.ex. :LspInstallServer clangd)
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

set number
set relativenumber

syntax enable
set termguicolors
silent! colorscheme monokai

"" Cursor: bar in insert mode
let &t_SI = "\e[6 q"
"" Cursor: block in nomral mode
let &t_EI = "\e[2 q"

"" Leave insert mode after 5s inactivity
set updatetime=5000
autocmd CursorHoldI * stopinsert

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
