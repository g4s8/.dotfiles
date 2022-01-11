setlocal shiftwidth=8

let g:go_fmt_command="gopls"
let g:go_gopls_gofumpt=1

" go to
nnoremap <buffer> <Space>gt :GoDef<CR>

" complete
" inoremap <C-x><C-o> <C-Space>
