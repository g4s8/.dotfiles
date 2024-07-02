setlocal shiftwidth=8

let g:go_fmt_command="gopls"
let g:go_gopls_gofumpt=1

" go to
nnoremap <buffer> <Space>gt :GoDef<CR>
nnoremap <buffer> <Space>gi :GoImplements<CR>
nnoremap <buffer> <Space>gc :GoCallers<CR>
nnoremap <buffer> <Space>gb :GoBuild<CR>
nnoremap <buffer> <Space>gr :GoReferrers<CR>

" complete
" inoremap <C-x><C-o> <C-Space>
