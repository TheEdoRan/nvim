" PLUGINS

call plug#begin(stdpath('data') . '/plugged')

" Theme
Plug 'theedoran/vim-code-dark'

" Status line
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" Auto unhighlight after search
Plug 'romainl/vim-cool'

" Mega giga language pack
Plug 'sheerun/vim-polyglot'

" Command repeating
Plug 'tpope/vim-repeat'

" Line indentation
Plug 'Yggdroot/indentLine'

" Commenting
Plug 'preservim/nerdcommenter'

" Buffers
Plug 'mhinz/vim-sayonara'

" Surrounding
Plug 'tpope/vim-surround'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Session saving
Plug 'thaerkh/vim-workspace'

" Fuzzy finder
Plug 'junegunn/fzf.vim'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Rainbow parentheses
Plug 'luochen1990/rainbow'

" Colors
Plug 'norcalli/nvim-colorizer.lua'
Plug 'KabbAmine/vCoolor.vim'

" Easy tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" Easy split zooming/unzooming
Plug 'dhruvasagar/vim-zoom'

" Unwanted whitespace
Plug 'ntpeters/vim-better-whitespace'

" Highlight after yank
Plug 'machakann/vim-highlightedyank'

call plug#end()



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

" Language pack
let g:polyglot_disabled = ['css', 'markdown', 'md']

" Indent line
let g:indentLine_char_list = ['┊']
let g:indentLine_fileTypeExclude = ['text', 'md', 'markdown']

"" Commenting
nmap <C-c> <plug>NERDCommenterToggle
vmap <C-c> <plug>NERDCommenterToggle
nmap <C-x> <plug>NERDCommenterAltDelims
let g:NERDCreateDefaultMappings = 0

" Tree
nmap <silent> <C-n> :<C-u>CocCommand explorer<CR>

" Auto refresh when focusing tree.
autocmd! BufEnter * if &ft == "coc-explorer" | call feedkeys("R") | endif

" Exit nvim if coc-explorer is last window open.
autocmd! BufEnter * if (winnr("$") == 1 && stridx(bufname("%"), "[coc-explorer]") == 0) | quitall | endif

" Buffers
function! ExitBuffer(force_quit)
  " SPLITS
  " if windows number is greater than one (at least one split)
  " and coc-explorer is not open,
  " or windows number is greater than two (at least one split) and
  " coc explorer is open, execute Sayonara.
  if ((winnr("$") > 1 && bufwinnr("[coc-explorer") == -1) ||
        \ winnr("$") > 2 && bufwinnr("[coc-explorer") > -1)
    exec ':Sayonara'
  " ONE BUFFER
  " Otherwise, if there's only one buffer in tabline,
  elseif (len(getbufinfo({'buflisted':1})) <= 1)
    " if ! is passed, force exit.
    if a:force_quit
      exec ':q!'
      " otherwise, exit.
    else
      exec ':q'
    endif

    " In all other cases, execute Sayonara! to preserve
    " window layout.
  else
    exec ':Sayonara!'
  endif
endfunction

command! -bang -bar ExitBfr call ExitBuffer(<bang>0)

cnoreabbrev q ExitBfr
cnoreabbrev wq w<bar> ExitBfr

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

" Fuzzy finder
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-s': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

function! FZFFiles ()
  if isdirectory(".git")
    return ":GFiles"
  else
    return ":Files"
  endif
endfunction

command! -nargs=0 FZFFiles exec FZFFiles()

nnoremap <C-p> :<C-u>FZFFiles<CR>

nnoremap <C-f> :<C-u>Rg<CR>
nnoremap <C-q> :<C-u>BLines<CR>
"nnoremap <leader>t :Tags<CR>

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" Completion
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

" CoC extensions
let g:coc_global_extensions = ['coc-json', 'coc-html', 'coc-yaml', 'coc-emmet', 'coc-tsserver', 'coc-python', 'coc-xml', 'coc-css', 'coc-snippets', 'coc-prettier', 'coc-explorer', 'coc-pairs', 'coc-vimlsp']

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> <g <Plug>(coc-diagnostic-prev)
"nmap <silent> >g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <F2> <Plug>(coc-rename)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)


" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

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
