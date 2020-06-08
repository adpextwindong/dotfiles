set number
set fileformat=unix

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

" Turn off syntax highlighting for markdown files.
autocmd BufRead,BufNewFile {*.markdown,*.mdown,*.mkdn,*.md,*.mkd,*.mdwn,*.mdtxt,*.mdtext} set filetype=markdown
autocmd FileType markdown setlocal syntax=off


" HOTFIX TERM COLORS FOR TMUX
" This is only necessary if you use "set termguicolors".
set t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
set t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" fixes glitch? in colors when using vim with tmux
set background=dark
set t_Co=256
