function! neoformat#formatters#java#enabled() abort
   return ['uncrustify']
endfunction

function! neoformat#formatters#java#uncrustify() abort
     return {
            \ 'exe': 'uncrustify',
            \ 'args': ['-q', '-l JAVA'],
            \ 'stdin': 1,
            \ }
endfunction

