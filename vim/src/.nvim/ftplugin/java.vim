" vim config for java filetype

setlocal shiftwidth=4
set colorcolumn=100

" Helper local functions
fun! RunSurefireTest()
  exec ':!mvn test -Dtest=' . s:CwordLocator()
endfun

fun! RunFailsafeTest()
  exec ':!mvn verify -Dit.test=' . s:CwordLocator()
endfun

" Cursor locator, class or method.
" Escapes '#' with '\#'.
" E.g.: com.test.Foo\#bar
fun! s:CwordLocator()
  let l:testName = expand("<cword>")
  let l:className = expand('%:t:r')
  let l:packageName = JavaPackageName()
  let l:fullName = l:packageName . '.' . l:className
  if l:testName == l:className
    let l:locator = l:fullName
  else
    let l:locator = l:fullName . '\#' . l:testName
  endif
  return l:locator
endfun

" hotkeys
" fix it
nnoremap <buffer> <A-CR> :YcmCompleter FixIt<CR>
nnoremap <buffer> <Space>fi :YcmCompleter FixIt<CR>
" show docs
nnoremap <buffer> <Space>gd :YcmCompleter GetDoc<CR>
" go to
nnoremap <buffer> <Space>gt :YcmCompleter GoTo<CR>
" go to references
nnoremap <buffer> <Space>gr :YcmCompleter GoToReferences<CR> 
" go to implementation
nnoremap <buffer> <Space>gi :YcmCompleter GoToImplementation<CR>
" new test method
nnoremap <buffer> <Space>ntm :r ~/.vim/templates/test-method.java<CR>
" format code
nnoremap <buffer> <Space>ff :YcmCompleter Format<CR>
" rename
nnoremap <buffer> <Space>rr :YcmCompleter RefactorRename<CR>

" inline
" constant (private static final)
inoremap <buffer> \.const private<Space>static<Space>final<Space>
" make variable
inoremap <buffer> \.var ;<Esc>^ifinal<Space>=<Space><Esc>hhi<Space>
" wrap with if () {}
inoremap <buffer> \.if )<Space>{}<Esc>^iif<Space>(<Esc>f{a<CR><Esc>O
" wrap with try () {}
inoremap <buffer> \.with )<Space>{}<Esc>^itry<Space>(<Esc>f{a<CR><Esc>O
" wrap with for () {}
inoremap <buffer> \.iter )<Space>{}<Esc>^ifor<Space>(<Esc>f{a<CR><Esc>k^f(afinal<Space>=<Space><Esc>hhi<Space>
" wrap with try () {} catch {}
inoremap <buffer> \.try <Esc>v><Esc>Otry<Space>{<Esc>jo}<Space>catch<Space>(final Exception err)<Space>{}<Esc>ha<CR><Esc>O
" rethrow exception
inoremap <buffer> \.rthr throw<Space>new<Space>IOException("",<Space>err);<Esc>F(la
" throw new exception
inoremap <buffer> \.thr throw<Space>new<Space>IOException("");<Esc>F(la

" Run tests
nnoremap <buffer> <Space>rst :call RunSurefireTest()<CR>
nnoremap <buffer> <Space>rft :call RunFailsafeTest()<CR>
