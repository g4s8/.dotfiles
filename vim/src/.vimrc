scriptencoding utf-8
set nocompatible
filetype off

" Plugins
if has('nvim')
  call plug#begin('~/.nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif
Plug 'fatih/vim-go'
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
if !has('nvim')
  Plug 'https://github.com/chrisbra/vim-autoread.git'
endif
Plug 'gorkunov/smartpairs.vim'
Plug 'artur-shaik/vim-javacomplete2' " java autocompletion
Plug 'sbdchd/neoformat' " auto-formatting
" generic autocompletion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'https://github.com/Shougo/denite.nvim'
"Plug 'neomake/neomake' " linting (conflict with ale)
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'chrisbra/color_highlight'
Plug 'mkitt/tabline.vim'
call plug#end()

syntax on
set hlsearch

set wildmode=longest,list,full
set wildmenu
set backspace=indent,eol,start

set nobackup

set history=500 

set ruler "show the cursor position
set showcmd "display incomplete commands
set incsearch

if has('mouse')
  set mouse=a
endif

set scrolljump=8
set scrolloff=8

set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

set exrc "use external .vimrc in current folder root
set secure

set number " show line numbers

" search
if executable('ag')
    " Use ag (the silver searcher)
    " https://github.com/ggreer/the_silver_searcher
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '-i --line-numbers --nocolor ' .
                \ '--nogroup --hidden --ignore ' .
                \ '''.hg'' --ignore ''.svn'' --ignore' .
                \ ' ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <C-S-r> :Denite file_rec<CR>

" deoplate
" > Dark powered asynchronous completion framework for neovim/Vim8
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
let g:deoplete#sources = {}
let g:deoplete#sources._ = []
let g:deoplete#file#enable_buffer_path = 1

" javacomplete2
let g:JavaComplete_ImportOrder = ['*']
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java nmap <C-S-o> <Plug>(JavaComplete-Imports-RemoveUnused)
autocmd FileType java nmap <C-S-i> <Plug>(JavaComplete-Imports-Add)
autocmd FileType java imap <C-S-i> <Plug>(JavaComplete-Imports-Add)

" neomake (linter)
"autocmd! BufWritePost,BufEnter * Neomake
"autocmd FileType java nmap <C-S-l> :Neomake javac<CR>
" ale (linter)
let g:ale_linters               = {'java': ['javac', 'checkstyle'], 'go': ['gofmt', 'goimports', 'golint']}
let g:ale_echo_msg_error_str    = 'ERROR'
let g:ale_echo_msg_warning_str  = 'WARN'
let g:ale_echo_msg_format       = '[%severity% (%linter%)]: %s'
"let g:ale_sign_error            = ' '
"let g:ale_sign_warning           = ' '
let g:ale_sign_error            = '>>'
let g:ale_sign_warning          = '>>'
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_java_checkstyle_options = '-c ~/.qulice.checkstyle.xml'

" neoformat
noremap <C-S-f> :Neoformat<CR>
"TODO: fix uncristify config
"augroup uncrustify
"  autocmd!
"  autocmd BufWritePre * Neoformat
"augroup END

" Buffer navigation
nnoremap <F5> :BufExplorer<CR>
nnoremap <A-right> :bn<CR>i
nnoremap <A-left> :bp<CR>i
nnoremap <C-Tab> :bn<CR>i
nnoremap <C-S-Tab> :bp<CR>i

nnoremap <left> b
nnoremap <right> e
nnoremap <up> <PageUp>
nnoremap <down> <PageDown>

" TAB = indent, Shift+TAB = dedent
vmap <Tab> <gv
vmap <S-Tab> >gv

" refactor rename
nnoremap <C-A-r> :%s/\<<C-r>=expand("<cword>")<CR>\>/

" nerd-tree
nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeAutoCenter          = 1
let g:NERDTreeAutoCenterThreshold = 8
let g:NERDTreeChDirMode           = 2
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeIgnore              = ['.git$[[dir]]', 'target$[[dir]]', '.idea$[[dir]]', '\.iml$[[file]]', 'build$[[dir]]']
let g:NERDTreeWinSize             = 40
let g:NERDTreeShowHidden          = 1
let g:NERDTreeShowLineNumbers     = 0
let g:NERDTreeMinimalUI           = 1

" tag-bar
let g:tagbar_width = 50
nnoremap <C-t> :TagbarToggle<CR>

nnoremap <Space> <PageDown>

" CTRL+Space for completions
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>


filetype plugin indent on

let g:seoul256_background = 235
colo seoul256
