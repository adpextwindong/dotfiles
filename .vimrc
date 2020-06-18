syntax on
set number
set fileformat=unix

" Show existing tabs with 4 space width and indent > with 4 spaces
set tabstop=4
set shiftwidth=4

set autoindent

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

set backspace=2

" Tmux Specific Settings
if exists('$TMUX')
    set background=dark
    set t_Co=256

    " Visual Mode Highlighting Hotfix
    set hlsearch
    hi Visual ctermbg=Grey ctermfg=Black
endif
