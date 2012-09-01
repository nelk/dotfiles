
filetype off
call pathogen#infect()
filetype plugin indent on


" set UTF-encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set nocompatible
set modelines=0

set autoindent
set smartindent

set tabstop=4        " tab width isspaces
set shiftwidth=4     " indent also withspaces
set softtabstop=4
set expandtab        " expand tabs to spaces

set scrolloff=3
set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile

set wrap
set textwidth=79 " 120
set formatoptions=qrn1
" set colorcolumn=85

" turn syntax highlighting on
" set t_Co=256
syntax on
colorscheme molokai " ansi_blows wombat256mod
set number
set relativenumber
set showmatch " highlight matching braces
set comments=sl:/*,mb:\ *,elx:\ */ " intelligent comments

" Fix regex behavior
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" Hide search matches shortcut
nnoremap <leader><space> :noh<cr>
" Tab is now %
nnoremap <tab> %
vnoremap <tab> %

" Moving while scrolling
  nnoremap ∆ j<C-E>
  nnoremap ˚ k<C-Y>
  nnoremap ¬ 3j3<C-E>
  nnoremap ˙ 3k3<C-Y>
"

set list
set listchars=tab:▸\ ,eol:¬

" Load standard tag files
" set tags=~/.vim/tags
" set tags+=~/.vim/tags/cpp
" set tags+=~/.vim/tags/gl
" set tags+=~/.vim/tags/sdl
" set tags+=~/.vim/tags/qt4

" hidden
set hidden
" conceal
set conceallevel=2
set concealcursor="nivc"

" clang_complete settings
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'
let g:clang_auto_select = 1
let g:clang_hl_errors = 1
let g:clang_conceal_snippets = 1


" Install DoxygenToolkit from http://www.vim.org/scripts/script.php?script_id=987

" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
" map <F5> :!ctags -R .<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>
" in diff mode we use the spell check keys for merging
if &diff
  " diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " spell settings
  :setlocal spell spelllang=en
  " set the spellfile - folders must exist
  set spellfile=~/.vim/spellfile.add
  map <M-Down> ]s
  map <M-Up> [s
endif

" open new file in tab shortcut
nnoremap <leader>o :tabe .<CR>

" Splitting window shortcut
nnoremap <leader>w <C-w>v<C-w>l
" Window movement shortcuts
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-k>k
nnoremap <C-l> <C-l>l
nnoremap <C-h> <C-h>h


" vim-sparkup unmap <C-E> for normal mode (want my 'extra' line default mapping)

" function! FixMappings()
    " if exists('g:sparkupExecuteMapping')
        " nunmap <buffer> g:sparkupExecuteMapping
    " endif
" endfunction

" autocmd VimEnter * call FixMappings()

