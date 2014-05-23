
set nocompatible

execute pathogen#incubate()

filetype off " Required to ensure reloading of ftdetect with pathogen
filetype plugin indent on
syntax on

set t_Co=256
"set modelines=0

colorscheme molokai
hi Normal ctermbg=none

set guifont=Monospace\ 14
set tags=tags;
set backspace=indent,eol,start
set wrap
set novisualbell
"set cursorline " Slow
set ruler
set undofile
"set relativenumber " Slow
set number
set scrolloff=3 " Leave 3 lines above/below cursor visible at all times

set shiftwidth=2
set tabstop=2

" Can leave modified buffers
set hidden

" Searching
set ignorecase
set smartcase
set gdefault
set hlsearch

" Whitespace characters
set list
set wrap
set expandtab
set listchars=tab:»·,trail:·

" Prevent hard-wrap
au BufNewFile,BufRead * set textwidth=0
set wrapmargin=0

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

" Fix file type
" au BufNewFile,BufRead *.h,*.c set ft=c
" au BufNewFile,BufRead *.cpp set ft=cpp

" Window sizing
set winheight=25
set winminheight=0

" Shortcut Section ---------------

nnoremap <leader><space> :noh<cr>

" ctags aliases
nnoremap <leader><leader>c !ctags -Rf - --format=2 --excmd=pattern --extra= --fields=nksaSmt

" NERDTree shortcuts
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <leader>N :NERDTreeClose<CR>

" Vimux aliases
nnoremap <leader>vp :VimuxPromptCommand<CR>
nnoremap <leader>vl :VimuxRunLastCommand<CR>

" Show indent guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup=1

" Indent guides highlights
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#111111 ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#222222 ctermbg=234


" Bookmarking Awesome
let g:BookmarksFile = "~/bookmarks"
function! CreateBookmark()
	let f = @%
	let l = line('.')
	execute "e + " . g:BookmarksFile
	execute "norm o" . f . ":" . l . " "
	startinsert!
endfunction

function! GoToBookmarks()
execute "e " . g:BookmarksFile
endfunction

nmap <leader>m :call GoToBookmarks()<CR>
nmap <leader>M :call CreateBookmark()<CR>
" End Bookmarking Awesome

" Folding shortcut
nnoremap <leader>zf :set foldmethod=indent<CR>zM
nnoremap <leader>zF :set foldmethod=manual<CR>zR

" Ctrl+P excludes
let g:ctrlp_custom_ignore = '\v\.(o|hi)$'

" haskellmode-vim settings
"au Bufenter *.hs compiler ghc
"let g:haddock_browser="gnome-open"
"let g:haddock_docdir=""
"set makeprg=cabal\ build

" vim-multiple-cursors settings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<C-c>'

" Powerline
set laststatus=2


