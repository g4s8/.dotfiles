"
" My vim configuration 
"

scriptencoding utf-8


syntax on
set hlsearch

set wildmode=longest,list,full
set wildmenu
set backspace=indent,eol,start

set nobackup

set history=50 

set ruler "show the cursor position
set showcmd "display incomplete commands
set incsearch

if has('mouse')
  set mouse=a
endif

set scrolljump=7
set scrolloff=7

set expandtab
set tabstop=2
set shiftwidth=2
set smarttab


set exrc "use external .vimrc in current folder root
set secure

" show line numbers
set number

" Buffers
nnoremap <F5> :BufExplorer<CR>
nnoremap <C-Tab> :bn<CR>i
nnoremap <C-S-Tab> :bp<CR>i

nnoremap <left> ^
nnoremap <right> $
nnoremap <up> gg
nnoremap <down> G   

vmap <Tab> <gv
vmap <S-Tab> >gv

nnoremap ; :%s/\<<C-r>=expand("<cword>")<CR>\>/


nnoremap <C-n> :NERDTreeToggle<CR>

nnoremap <Space> <PageDown>

set nocompatible
filetype off

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/chrisbra/vim-autoread.git'
Plug 'gorkunov/smartpairs.vim'
Plug 'gorkunov/smartgf.vim'
call plug#end()

filetype plugin indent on

let g:seoul256_background = 235
colo seoul256
