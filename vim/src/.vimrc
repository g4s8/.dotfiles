" ~/.vimrc by github.com/g4s8

" Unicode
scriptencoding utf-8
" Not compatible with vi
set nocompatible
" Syntax detection
syntax on
" Highlight search
set hlsearch
" Menu config
set wildmode=longest,list,full
" set wildmode=
" Backspace behaviour
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"         stop once at the start of insert.
set backspace=indent,eol,start
" No backup files
set nobackup
" History size
set history=500 
"show the cursor position
set ruler
"display incomplete commands
set showcmd
" Show matched pattern when typing search command
set incsearch
" smart search case
set ignorecase smartcase

" Mouse config
if has('mouse')
  set mouse=a
endif

" Scrolling config
set scrolljump=8
set scrolloff=8

" Tabs config
set expandtab
set shiftwidth=2
set smarttab

" Use external .vimrc in current folder root
set exrc
" Forbid buffer writing, shell commands
" and autocmd from local dir .vimrc files
set secure

" show line numbers
set number relativenumber

" Plugins declaration
if has('nvim')
  call plug#begin('~/.nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

" GoLang support
Plug 'fatih/vim-go'

" Some vim defaults
Plug 'tpope/vim-sensible'

" Color scheme
Plug 'junegunn/seoul256.vim'

" Navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Git status for files in NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'
if !has('nvim')
    "auto update buffer
    Plug 'https://github.com/chrisbra/vim-autoread.git' 
endif

" Easy selection pairs via `viv` and `vav`
Plug 'gorkunov/smartpairs.vim'

" Dev framework https://github.com/Valloric/YouCompleteMe
Plug 'Valloric/YouCompleteMe'

" Plug 'artur-shaik/vim-javacomplete2'

" Dark powered asynchronous unite all interfaces for Neovim/Vim8 
" if has('nvim')
"     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"     Plug 'Shougo/deoplete.nvim'
"     Plug 'roxma/nvim-yarp'
"     Plug 'roxma/vim-hug-neovim-rpc'
" endif

" Dark powered asynchronous unite all interfaces for Neovim/Vim8 
Plug 'https://github.com/Shougo/denite.nvim'

" TOML syntax
Plug 'cespare/vim-toml'

" Tag bar panel
Plug 'majutsushi/tagbar'
" Insert pairs [ -> []
Plug 'jiangmiao/auto-pairs'
" Linter
Plug 'w0rp/ale'
" Highlight hex colors like #ff0000 with :ColorHighlight
Plug 'chrisbra/color_highlight'
Plug 'mkitt/tabline.vim'
" Show additiona/deletions/modifications 
Plug 'airblade/vim-gitgutter'
" Ethereum solidity syntax
Plug 'tomlion/vim-solidity'
" Language tool
Plug 'dpelle/vim-LanguageTool'
" sneak
Plug 'justinmk/vim-sneak'
" terraform syntax
Plug 'hashivim/vim-terraform'
" scriptease.vim: A Vim plugin for Vim plugins
Plug 'tpope/vim-scriptease'
" Licenser plugin
Plug 'g4s8/vim-licenser'
" Comment lines in source files
Plug 'tpope/vim-commentary'
" File navigation
Plug 'ctrlpvim/ctrlp.vim'
" git blame
Plug 'zivyangll/git-blame.vim'
" XML completion
" Plug 'vim-scripts/XML-Completion'
" Rust
Plug 'rust-lang/rust.vim'
" Handlebars
Plug 'mustache/vim-mustache-handlebars'

" nginx config
Plug 'chr4/nginx.vim'

" parentheses, brackets, quotes, XML tags, and more
Plug 'tpope/vim-surround'

" pugjs
Plug 'digitaltoad/vim-pug'
"
" Plug 'vim-latex/vim-latex'

" nodejs
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" TLA+
Plug 'vim-scripts/tla.vim'

call plug#end()

""" Mappings

" Mapping tab character to Shift+Tab
inoremap <S-Tab> <C-V><Tab>

" Tabs navigation
nnoremap <C-t> :tabnew<CR>
nnoremap <C-right> :tabnext<CR>
nnoremap <C-left> :tabprevious<CR>
nnoremap <C-w> :tabclose<CR>

" Arrows
nnoremap <left> b
nnoremap <right> e
nnoremap <up> <PageUp>
nnoremap <down> <PageDown>
inoremap <S-left> ←
inoremap <S-right> →
inoremap <S-up> ↑
inoremap <S-down> ↓
" TODO: use alt
" inoremap <S-up> ▲
" inoremap <S-down> ▼
" inoremap <S-left> ◀
" inoremap <S-right> ▶

" TAB = indent, Shift+TAB = dedent
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv

nnoremap <Space> <PageDown>

nnoremap tg :TagbarToggle<CR>

""" Plugin config

" ALE linters config
let g:ale_linters               = {
      \ 'java': ['javac', 'checkstyle'],
      \ 'go': ['gofmt', 'goimports', 'golint'],
      \ }
let g:ale_echo_msg_error_str = 'ERROR'
let g:ale_echo_msg_warning_str = 'WARN'
let g:ale_echo_msg_format = '[%severity% (%linter%)]: %s'
let g:ale_sign_error = ' '
let g:ale_sign_warning = ' '
let g:ale_java_checkstyle_options = '-c ~/.qulice.checkstyle.xml'

"git blame config
nnoremap gb :<C-u>call gitblame#echo()<CR>

" refactor rename
" nnoremap <C-A-r> :%s/\<<C-r>=expand("<cword>")<CR>\>/

" nerd-tree config
nnoremap <C-n> :NERDTreeToggle<CR>

let g:NERDTreeAutoCenter          = 1
let g:NERDTreeAutoCenterThreshold = 8
let g:NERDTreeChDirMode           = 2
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeIgnore              = [
  \ '.git$[[dir]]', 'target$[[dir]]', '.idea$[[dir]]',
  \ '\.iml$[[file]]', 'build$[[dir]]',
  \ ]
let g:NERDTreeWinSize             = 40
let g:NERDTreeShowHidden          = 1
let g:NERDTreeShowLineNumbers     = 0
let g:NERDTreeMinimalUI           = 1

augroup NERDTree
  autocmd!
  " open NERDTree if open directory
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
  " close NERDTree if it's a last window
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" tag-bar config
let g:tagbar_width = 50

" seoul256 config
let g:seoul256_background = 256
colo seoul256-light

" CTRL+Space for completions
" inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
"             \ "\<lt>C-n>" :
"             \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
"             \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
"             \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
" imap <C-@> <C-Space>

" ctrl-p config
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|target|node_modules|_build)$',
  \ 'file': '\v\.(so|class|o)$',
  \ }

" tagbar config
nnoremap <F4> :TagbarToggle<CR>

" custom templates
augroup templates
  " autocmd FileType *java setlocal omnifunc=javacomplete#Complete

  autocmd!
  autocmd BufRead *.java if getfsize(expand('%'))==0|$r ~/.vim/templates/skeleton.java|call s:SetupJavaClass()|endif
  autocmd BufNewFile *java $r ~/.vim/templates/skeleton.java|call s:SetupJavaClass()

  autocmd BufRead *.xsd if getfsize(expand('%'))==0|$r ~/.vim/templates/skeleton.xsd|endif
  autocmd BufNewFile *.xsd $r ~/.vim/templates/skeleton.xsd

  autocmd BufRead pom.xml if getfsize(expand('%'))==0|$r ~/.vim/templates/skeleton.pom.xml|endif
  autocmd BufNewFile pom.xml $r ~/.vim/templates/skeleton.pom.xml

  autocmd BufRead *.sh if getfsize(expand('%'))==0|$r ~/.vim/templates/skeleton.sh|endif
  autocmd BufNewFile *.sh $r ~/.vim/templates/skeleton.sh

  fun! JavaPackageName()
    " reversed path array
    let l:path = reverse(split(expand('%:h'), '/'))
    let l:rootId = index(l:path, 'java')
    if l:rootId > 0
      return join(reverse(l:path[:l:rootId - 1]), '.')
    endif
    return ''
  endfun

  fun! s:SetupJavaClass()
    exe "%s/__CLASS_NAME__/" . expand('%:t:r')
    let l:package = JavaPackageName()
    if len(l:package) > 0
      exe "%s/__PACKAGE_NAME__/" . l:package
    endif
  endfun
augroup END

filetype plugin indent on

