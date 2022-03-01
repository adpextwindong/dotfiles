let mapleader=" "

"Vimux Binds
"https://github.com/preservim/vimux

map <Leader>ri :call VimuxRunCommand("clear; ghci " . bufname("%"))<CR>
map <Leader>rc :call VimuxRunCommand("clear; cabal repl " . bufname("%"))<CR>
map <Leader>rs :call VimuxRunCommand("clear; stack repl " . bufname("%"))<CR>
map <Leader>rr :call VimuxSendText(":r\r")<CR>

syntax on
set number
set fileformat=unix

" Show existing tabs with 2 space width and indent > with 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2

set autoindent

" On pressing tab, insert 2 spaces
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

" NerdTree Settings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
