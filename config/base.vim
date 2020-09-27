" Most of basic configuration borrowed from https://github.com/amix/vimrc
set mouse=a

set history=1000

set shell=bash
let $SHELL='/usr/bin/bash'

filetype plugin on
filetype indent on

set encoding=utf-8
set fileencoding=utf-8

set autoread
au FocusGained,BufEnter * checktime

" Fuzzy file finder
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
set inccommand=nosplit

set lazyredraw
set magic

set showmatch
set mat=2

set timeoutlen=1000 ttimeoutlen=0
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
set signcolumn=yes
set colorcolumn=80
set autoindent
set smartindent
set wrap

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set cursorline
set laststatus=2
set noshowmode
set showtabline=2
set shortmess+=c

noremap x "_x
noremap X "_x

" Save end exit with uppercase letters
:cab W w
:cab Q q
:cab Wq wq
:cab WQ wq
:cab wQ wq

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
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" JSON comment detection
autocmd FileType json syntax match Comment +\/\/.\+$+

" Python indent
autocmd FileType python setlocal tabstop=2 shiftwidth=2

" Remap buffer jumps
nnoremap <A-o> <C-o>
nnoremap <A-i> <C-i>

" Easier buffer cycling.
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>

" Close netrw after opening file.
let g:netrw_fastbrowse = 0

" Source current file
map <leader><space> :<C-u>source %<CR>
