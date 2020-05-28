" Show existing tabs with 4 space width and indent > with 4 spaces
set tabstop=4
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab

set splitbelow
set splitright

" Remap window pane navigation to C-HJKL
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritepre * %s/\n\+\%$//e
