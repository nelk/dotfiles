
execute pathogen#infect()

syntax on
filetype plugin indent on
set nocompatible
set t_Co=256
"set modelines=0

colorscheme molokai

set guifont=Monospace\ 14
set tags=tags;
set wrap
set novisualbell
"set cursorline " Slow
set ruler
set undofile
"set relativenumber " Slow
set number
set scrolloff=3 " Leave 3 lines above/below cursor visible at all times

set shiftwidth=4
set tabstop=4

" Can leave modified buffers
set hidden

" Whitespace characters
set list
set listchars=tab:»·,trail:·

" Very magic mode
nnoremap / /\v
vnoremap / /\v

" Quick window movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Quick substitution
nnoremap <leader>s :%s/\v
nnoremap <leader>f :Ack ""<left>


set ignorecase
set smartcase
set gdefault

" Prevent hard-wrap
au BufNewFile,BufRead * set textwidth=0
set wrapmargin=0

" Fix file type
" au BufNewFile,BufRead *.h,*.c set ft=c
" au BufNewFile,BufRead *.cpp set ft=cpp

nnoremap <leader><space> :noh<cr>

" ctags aliases
nnoremap <leader><leader>c !ctags -Rf - --format=2 --excmd=pattern --extra= --fields=nksaSmt

" Vimux aliases
nnoremap <leader>vp :VimuxPromptCommand<CR>
nnoremap <leader>vl :VimuxRunLastCommand<CR>

" Show indent guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup=1

" Indent guides highlights
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#111111 ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#222222 ctermbg=234


