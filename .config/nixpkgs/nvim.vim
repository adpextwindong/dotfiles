let mapleader=" "

set tabstop=2
set shiftwidth=2
set expandtab

syntax on
set number
set fileformat=unix

set autoindent

set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e

autocmd BufRead, BufNewFile {*.md} set filetype=markdown
" Alex lexer
autocmd BufRead, BufNewFile {*.y} set filetype=haskell
" Happy parser
autocmd BufRead, BufNewFile {*.x} set filetype=haskell
autocmd FileType markdown setlocal syntax=off

set backspace=2

" NERDTree

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree when Vim is started without file arguements
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Misc keybinds

nnoremap <C-v> :vsplit <cfile><CR>
