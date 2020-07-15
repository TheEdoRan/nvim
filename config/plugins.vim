" CONFIGURATION

" Set paths for Python executables
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

" Theme
" Enable true colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set t_Co=256
set t_ut=
colorscheme codedark

" Cursor line highlight color
highlight CursorLine guibg=#292929

" Language pack
let g:polyglot_disabled = ['css', 'markdown', 'md']

" Indent line
let g:indentLine_char_list = ['┊']
let g:indentLine_fileTypeExclude = ['text', 'md', 'markdown']

" Commenting
nmap <C-c> <plug>NERDCommenterToggle
vmap <C-c> <plug>NERDCommenterToggle
nmap <C-x> <plug>NERDCommenterAltDelims
let g:NERDCreateDefaultMappings = 0

" Git
let g:gitgutter_max_signs = -1
highlight GitGutterAdd    guifg=#5DFF5D ctermfg=2
highlight GitGutterChange guifg=#FFFF5E ctermfg=3
highlight GitGutterDelete guifg=#FF6969 ctermfg=1
nmap <leader>hn <Plug>(GitGutterNextHunk)
nmap <leader>hb <Plug>(GitGutterPrevHunk)
nmap <leader>hp <Plug>(GitGutterPreviewHunk)
nmap <leader>gb :<C-u>Gblame<cr>

function! ToggleGitDiffSplit()
  let l:bufnr = bufnr("^fugitive:///")
  if l:bufnr != -1
    exec 'bw ' . l:bufnr
  else
    exec 'Gdiffsplit'
  endif
endfunction

command! ToggleGitDiffSplit call ToggleGitDiffSplit()
nnoremap <leader>gd :<C-u>ToggleGitDiffSplit<CR>

" Session saving
let g:workspace_create_new_tabs = 0
let g:workspace_session_directory = stdpath('data') . '/sessions/'
let g:workspace_persist_undo_history = 0
let g:workspace_autosave = 0

" Ignore tree and other blank buffer types.
set sessionoptions-=blank
nnoremap <leader>s :ToggleWorkspace<CR>

" Smart line break
autocmd FileType markdown,mkd,text,mail,rst,tex,textile,asciidoc call pencil#init()

" Markdown preview
let g:mkdp_port = '42069'
nmap <leader>mp <Plug>MarkdownPreview

" Easy split zooming/unzooming
let g:zoom#statustext = '[ZOOM]'
nmap <C-s> <Plug>(zoom-toggle)

" Unwanted whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1

" Rainbow parentheses
let g:rainbow_active = 1

" Colors
lua require 'colorizer'.setup({'*';}, {names = true; RRGGBBAA = true; css = true;})

" Highlight after yank
let g:highlightedyank_highlight_duration = 200

" Easy motion
" <Leader>f{char} to move to {char(s)}
let g:EasyMotion_smartcase = 1

" <Leader>f{char} to move to {char}
map  f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
