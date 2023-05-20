" enable syntax highlighting
syntax enable

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

"set smartindent

set backspace=indent,eol,start

nnoremap Q @q

let mapleader = " "

" Moving b/w splits
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l
nnoremap <leader>k <c-w>k
nnoremap <leader>j <c-w>j
nnoremap <leader>w <c-w>w


" Faster vertical scroll
nnoremap <M-j> 15j
nnoremap <M-k> 15k

packadd! dracula
colorscheme dracula
