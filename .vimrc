
set nocompatible

execute pathogen#incubate()

filetype off " Required to ensure reloading of ftdetect with pathogen
filetype plugin indent on
syntax on

" Force colours.
set t_Co=256
"set modelines=0

colorscheme molokai
hi Normal ctermbg=none

set guifont=Monospace\ 12
set tags=tags;
set backspace=indent,eol,start
set wrap
set novisualbell
"set cursorline " Slow
set ruler
"set relativenumber " Slow
set number
set scrolloff=3 " Leave 3 lines above/below cursor visible at all times
set showcmd

set shiftwidth=2
set tabstop=2

" Can leave modified buffers
set hidden

" Save backup and undo files.
set dir=~/.vim/tempfiles/swap
set backupdir=~/.vim/tempfiles/backup
set undodir=~/.vim/tempfiles/undo
set backup
set undofile

" Searching
set ignorecase
set smartcase
set gdefault
set hlsearch

" Indentation
set smartindent
set autoindent

" Whitespace characters
set list
set wrap
set expandtab
set listchars=tab:»·,trail:·

" Powerline
set laststatus=2

" Prevent hard-wrap
au BufNewFile,BufRead * set textwidth=0
set wrapmargin=0

" Window sizing
set winheight=25
set winminheight=0

" Shortcut Section ---------------

" Very magic mode
nnoremap / /\v
vnoremap / /\v

" Quick window movement
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Move using visual lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Instead of Ex mode, format.
noremap Q gq

" Mouse.
if has('mouse')
  set mouse=a
endif

" Quick substitution.
nnoremap <leader>s :%s/\v
" Quick Ack.
nnoremap <leader>f :Ack ""<left>
" Quick Ack for word under cursor.
nnoremap <leader>* yiw:Ack "<c-r>""<cr>

" Eval in octave.
vnoremap <leader>o :!octave --silent \| sed "s/ans =//" - \| sed "/^\s*$/d" -<CR>

" Fix file type
" au BufNewFile,BufRead *.h,*.c set ft=c
" au BufNewFile,BufRead *.cpp set ft=cpp

" Remove highlighting for search terms.
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
let g:ctrlp_custom_ignore = '\v\.(o|hi|pdf|png|jpg|d)$'

" NERDTree excludes
let NERDTreeIgnore = ['\v\.(o|hi|pdf|png|jpg|d)$']

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

" vim-latex settings
let g:tex_flavor='latex'
let g:Tex_HotKeyMappings='enumerate,align*,bmatrix'
let g:Imap_UsePlaceHolders=0
" redef C-j to C-g
imap <C-g> <Plug>IMAP_JumpForward
nmap <C-g> <Plug>IMAP_JumpForward

" glsl
au BufNewFile,BufRead *.frag,*.vert set ft=glsl

" ycm
let g:ycm_global_ycm_extra_conf = '~/dotfiles/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 0
let g:ycm_semantic_triggers = {'haskell': ['.']}

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_asm_checkers = []
let g:syntastic_python_mypy_args = '--use-python-path'

" neco-ghc
let g:necoghc_enable_detailed_browse = 1
au BufRead *.hs,*.lhs setlocal omnifunc=necoghc#omnifunc

au BufRead *.azx set ft=azx
au BufRead BUILD set ft=python

