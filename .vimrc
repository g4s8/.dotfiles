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

set updatetime=200

set signcolumn=yes

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
" Plug 'Valloric/YouCompleteMe'

Plug 'neoclide/coc.nvim', {'branch': 'master'}

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
" Plug 'tomlion/vim-solidity'
" Language tool
Plug 'dpelle/vim-LanguageTool'
" sneak
Plug 'justinmk/vim-sneak'
" terraform syntax
" Plug 'hashivim/vim-terraform'
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

" Clap fuzzy picker
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

" nginx config
Plug 'chr4/nginx.vim'

" parentheses, brackets, quotes, XML tags, and more
Plug 'tpope/vim-surround'

" TLA+
Plug 'vim-scripts/tla.vim'

" Copylot
Plug 'github/copilot.vim', {'branch': 'release'}

" support repeat `.` command for plugins
Plug 'tpope/vim-repeat'

" For git merge tool
Plug 'tpope/vim-fugitive'

call plug#end()

""" Mappings

" Mapping tab character to Shift+Tab
inoremap <S-Tab> <C-V><Tab>

" Tabs navigation
nnoremap <right> :tabnext<CR>
nnoremap <left> :tabprevious<CR>
nnoremap <Space>tn :tabnew<CR>
nnoremap <Space>tc :tabclose<CR>
nnoremap <Space>tl :tabnext<CR>
nnoremap <Space>th :tabprevious<CR>
nnoremap <Space>nt :NERDTreeToggle<CR>

" Clap shortcuts
nnoremap <Space>cf :Clap files<CR>
nnoremap <Space>cg :Clap grep<CR>

" Other tools
nnoremap <Space>gb :<C-u>call gitblame#echo()<CR>
nnoremap <Space>tb :TagbarToggle<CR>
nnoremap <Space>pwd :pwd<CR>

" Go
nnoremap <Space>gc :GoCallers<CR>

" Arrows
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

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"coc
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <C-Space>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-Space> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"


" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> <Space>gd <Plug>(coc-definition)
" nmap <silent> <Space>gy <Plug>(coc-type-definition)
nmap <silent> <Space>gi <Plug>(coc-implementation)
nmap <silent> <Space>gr <Plug>(coc-references)
nnoremap <silent> <Space>do :call ShowDocumentation()<CR>
nmap <leader><Space>rn <Plug>(coc-rename)

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

let g:copilot_filetypes = {
  \ '*': v:false,
  \ 'go': v:true,
  \ 'java': v:true,
  \ 'sql': v:true,
  \ 'xml': v:true,
  \ 'js': v:true,
  \ 'html': v:true,
  \ 'python': v:true,
  \ 'rust': v:true,
  \ 'c': v:true,
  \ 'h': v:true,
  \ 'sol': v:true,
  \ 'sh': v:true,
  \ 'Makefile': v:true,
  \ 'Dockerfile': v:true,
  \ }

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

augroup go_pkg
  "  cat go.mod | grep module | gawk 'match($0, /module\s(.+)\/(.+)/, a) {print a[2]}'
  fun! s:InsertPackage()
    let l:path = split(resolve(expand('%:p:h')), '/')
    let l:cwd = reverse(l:path)[0]
    let l:isroot = filereadable(resolve(expand('%:p:h')) . '/go.mod') == 1
    let l:iscmd = index(l:path, 'cmd') >= 0
    let l:pkgname = ''
    if l:iscmd || l:isroot
      let l:pkgname = 'main'
    else
      let l:pkgname = l:cwd
    endif
    exe "%s/__PACKAGE_NAME__/" . l:pkgname
  endfun

  " autocmd BufRead *.go if getfsize(expand('%'))==0|$0r ~/.vim/templates/skeleton.go|call s:InsertPackage()|endif
  " autocmd BufNewFile *.go $0r ~/.vim/templates/skeleton.go|call s:InsertPackage()
augroup END

augroup golang
  autocmd FileType go nnoremap <F9> :GoBuild<CR>
augroup END

augroup go_gofmt
  fun! s:Gofmt()
    let saved_view = winsaveview()
    silent %!gofmt
    if v:shell_error == 0
      silent %!gofumpt
    endif
    if v:shell_error != 0
      " show errors and open quickfix window
      cexpr getline(1, '$')->map({ idx, val -> val->substitute('<standard input>', expand('%'), '') })
      silent undo
      cwindow
    endif
    call winrestview(saved_view)
  endfun

  " autocmd BufWritePre *.go call s:Gofmt()
augroup END

filetype plugin indent on

