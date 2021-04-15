""" PLUGINS
call plug#begin(stdpath('data') . '/plugged')

Plug 'tomasiser/vim-code-dark'
Plug 'itchyny/lightline.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'terrortylor/nvim-comment'
Plug 'machakann/vim-highlightedyank'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Initialize plugin system
call plug#end()

""" CONFIGURATION

" Most of basic configuration borrowed from https://github.com/amix/vimrc
set mouse=a

set history=1000

filetype plugin on
filetype indent on

set encoding=utf-8
set fileencoding=utf-8

set autoread
au FocusGained,BufEnter * checktime

set path+=**
set wildignore+=**/node_modules/**

set wildmenu
set ruler
set cmdheight=1
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set number
set relativenumber

set foldlevel=99

set ignorecase
set hlsearch
set incsearch

set lazyredraw
set magic

set showmatch
set noshowmode
set mat=2

set timeoutlen=1000 ttimeoutlen=100
set updatetime=100
set noerrorbells
set novisualbell
set t_vb=
set tm=500

syntax enable
set ffs=unix,dos,mac

set nobackup
set nowritebackup
set noswapfile
set undofile
set undodir=$HOME/.local/share/nvim/undo
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

set scrolloff=7
set sidescrolloff=14
set sidescroll=5

set splitbelow
set splitright

set linebreak
set autoindent
set smartindent
set wrap

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe
\ "normal! g'\"" | endif

noremap x "_x
noremap X "_x

" Highlight all file
map  <C-a>  <esc>ggVG<cr>
imap <C-a>  <esc>ggVG<cr>

" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Copy and paste to system clipboard
nmap <Leader>dd "+dd
nmap <Leader>yy "+yy
nmap <Leader>y$ "+y$
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Disable comment on next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r
			\ formatoptions-=o

" JSON comment detection
autocmd FileType json syntax match Comment +\/\/.\+$+

" Python indent
autocmd FileType python setlocal tabstop=2 shiftwidth=2

" Remap buffer jumps
nnoremap <A-o> <C-o>
nnoremap <A-i> <C-i>

" Colorscheme
set t_Co=256
set t_ut=
colorscheme codedark

" PLUGINS CONFIGURATION
:lua require('nvim_comment').setup()
:lua require('nvim-autopairs').setup()

" Lightline
let g:lightline = { 'colorscheme': 'codedark',
  \ 'enable': { 'tabline': 0 }
  \ }

" Markdown preview
let g:mkdp_port = '42069'
nmap <leader>mp <Plug>MarkdownPreviewToggle

" Highlighted yank
let g:highlightedyank_highlight_duration = 300

" Tabline (barbar)

" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
nnoremap <silent>    <C-w> :BufferClose<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>
