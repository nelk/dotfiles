
set nocompatible
filetype off " Required to ensure reloading of ftdetect with pathogen

" Download plug-vim.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

Plug 'Lokaltog/vim-easymotion'
Plug 'Lokaltog/vim-powerline'
Plug 'airblade/vim-gitgutter'
Plug 'benmills/vimux'
Plug 'chrisbra/Replay'
Plug 'coderifous/textobj-word-column.vim'
Plug 'derekwyatt/vim-scala'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/unite.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'robbyrussell/oh-my-zsh'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
"Plug 'tpope/vim-vinegar'

"Plug 'Valloric/YouCompleteMe'
"Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'neomake/neomake'
Plug 'scrooloose/syntastic'

"Plug 'raichoo/haskell-vim'
Plug 'neovimhaskell/haskell-vim'
"Plug 'begriffs/vim-haskellConceal'
"Plug 'eagletmt/neco-ghc'
Plug 'parsonsmatt/intero-neovim'

call plug#end()

filetype plugin indent on
syntax on

" Force colours.
set t_Co=256
"set modelines=0

colorscheme molokai
hi Normal ctermbg=none

"set guifont=Monospace\ 12
set tags=tags;
set backspace=indent,eol,start
set wrap
set novisualbell
"set cursorline
"set cursorcolumn
set ruler
"set relativenumber " Slow
set number
set scrolloff=3 " Leave 3 lines above/below cursor visible at all times
set showcmd
set splitright

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

" Unite bindings.
let g:unite_source_history_yank_enable = 1
let g:unite_data_directory = '~/.vim/tempfiles/unite'
let g:unite_source_grep_command = 'ack'
let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
let g:unite_source_rec_async_command = 'ack -f --nofilter'
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_rec,file_rec/async,file', 'ignore_pattern', '\(\.cabal-sandbox/\|\.\(hi\|o\|d\|pdf\|png\|jpg\)$\)')
nnoremap <c-p>     :Unite -buffer-name=files -start-insert file_rec/neovim<cr>
nnoremap <leader>r :Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>y :Unite -no-split -buffer-name=yank                  history/yank<cr>
nnoremap <leader>b :Unite -no-split -buffer-name=buffer                buffer<cr>
nnoremap <leader>f :Unite -no-split -buffer-name=ack                   grep:.<cr>
nnoremap <leader>* yiw:Unite -no-split -buffer-name=ack grep:.<cr>"<c-r>""<cr>

" Quick substitution.
nnoremap <leader>s :%s/\v

" Eval in octave.
vnoremap <leader><leader>o :!octave --silent \| sed "s/ans =//" - \| sed "/^\s*$/d" -<CR>

" Fix file type
" au BufNewFile,BufRead *.h,*.c set ft=c
" au BufNewFile,BufRead *.cpp set ft=cpp

" Remove highlighting for search terms.
nnoremap <leader><space> :noh<cr>

" ctags aliases
nnoremap <leader><leader>c !ctags -Rf - --format=2 --excmd=pattern --extra= --fields=nksaSmt

" NERDTree
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <leader>N :NERDTreeClose<CR>
let NERDTreeIgnore = ['\v\.(o|hi|pdf|png|jpg|d)$']

" Vimux aliases
nnoremap <leader>vp :VimuxPromptCommand<CR>
nnoremap <leader>vl :VimuxRunLastCommand<CR>

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

" File explorer (netrw) settings
set wildignore=*.o,*.hi,*.d,*.pyc
let g:netrw_liststyle=3

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
let g:ycm_semantic_triggers = {'haskell': ['.']} " Require something to be set for it to work with neco-ghc.

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_asm_checkers = []
"let g:syntastic_python_mypy_args = '--use-python-path'
"let g:syntastic_mode_map = {
"    \ "mode": "passive",
"    \ "active_filetypes": ["python"]}
"nnoremap <leader>c :SyntasticCheck<return>

" Neomake
"let g:neomake_open_list = 2 " Disable cursor stealing.
"let g:neomake_haskell_enabled_makers = ['ghcmod_check'] ", 'ghcmod_lint']
"let g:neomake_scala_enabled_makers = [] "['activator_compile']
"let g:neomake_sbt_enabled_makers = []
"let g:neomake_cpp_enabled_makers = []
"let g:neomake_open_list = 1
"let g:neomake_error_sign = {
"  \ 'texthl': 'SpellBad',
"  \ 'linehl': 'SpellBad',
"  \ }
"let g:neomake_warning_sign = {
"  \ 'texthl': 'WarningMsg',
"  \ 'linehl': 'WarningMsg',
"  \ }
"u! BufWritePost,BufReadPost * Neomake
"nnoremap <leader>c :Neomake<return>

"et g:neomake_javascript_enabled_makers = ['flow']

" neco-ghc
"et g:necoghc_enable_detailed_browse = 1
"au BufRead *.hs,*.lhs setlocal omnifunc=necoghc#omnifunc

"Intero
au BufWritePost *.hs InteroReload


au BufRead *.azx set ft=azx
au BufRead BUILD set ft=python

" Rainbow parentheses.
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

