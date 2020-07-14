" Status line
let g:lightline = {
\ 'colorscheme': 'codedark',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'modified', 'zoomed', 'cocstatus' ] ],
\   'right': [ [ 'percent', 'lineinfo' ],
\              [ 'fileformat', 'fileencoding', 'filetype' ] ]
\ },
\ 'inactive': {
\   'left': [ [ 'filename' ] ],
\   'right': [ [ '' ] ]
\ },
\ 'tabline': { 'left': [[ 'buffers' ]], 'right': [[ '' ]] },
\ 'component_expand': { 'buffers': 'lightline#bufferline#buffers' },
\ 'component_type': { 'buffers': 'tabsel' },
\ 'component_raw': { 'buffers': 1 },
\ 'component_function': { 'gitbranch': 'FugitiveHead', 'cocstatus': 'coc#status', 'zoomed': 'zoom#statusline' }
\}

let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#clickable = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#filename_modifier = ':t'

" Move between buffers with leader+number
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)
