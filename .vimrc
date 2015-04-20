﻿
set nocompatible
filetype off " Required to ensure reloading of ftdetect with Vundle/pathogen

set rtp+=~/.vim/bundle/Vundle
call vundle#begin('~/.vim/vundlebundle')

Plugin 'gmarik/Vundle'

Plugin 'Lokaltog/vim-easymotion'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Shougo/vimproc.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'begriffs/vim-haskellConceal'
Plugin 'nelk/neomake'
Plugin 'benmills/vimux'
Plugin 'chrisbra/Replay'
Plugin 'coderifous/textobj-word-column.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'eagletmt/neco-ghc'
Plugin 'Shougo/unite.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'raichoo/haskell-vim'
Plugin 'robbyrussell/oh-my-zsh'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

call vundle#end()

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
"set cursorline
"set cursorcolumn
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

" Unite bindings.
let g:unite_source_history_yank_enable = 1
let g:unite_data_directory = '~/.vim/tempfiles/unite'
let g:unite_source_grep_command = 'ack'
let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
let g:unite_source_rec_async_command = 'ack -f --nofilter'
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_rec,file_rec/async,file', 'ignore_pattern', '\(\.cabal-sandbox/\|\.\(hi\|o\|d\|pdf\|png\|jpg\)$\)')
nnoremap <c-p>     :Unite -no-split -buffer-name=files   -start-insert file_rec/async<cr>
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

" NERDTree shortcuts
nnoremap <leader>n :NERDTreeFind<CR>
nnoremap <leader>N :NERDTreeClose<CR>

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
let g:neomake_haskell_enabled_makers = ['ghcmod_check'] ", 'ghcmod_lint']
let g:neomake_scala_enabled_makers = ['activator_compile']
let g:neomake_cpp_enabled_makers = []
let g:neomake_open_list = 1
let g:neomake_error_sign = {
  \ 'texthl': 'SpellBad',
  \ 'linehl': 'SpellBad',
  \ }
let g:neomake_warning_sign = {
  \ 'texthl': 'WarningMsg',
  \ 'linehl': 'WarningMsg',
  \ }
au! BufWritePost,BufReadPost * Neomake
"nnoremap <leader>c :Neomake<return>

" neco-ghc
let g:necoghc_enable_detailed_browse = 1
au BufRead *.hs,*.lhs setlocal omnifunc=necoghc#omnifunc

au BufRead *.azx set ft=azx
au BufRead BUILD set ft=python

" Rainbow parentheses.
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

