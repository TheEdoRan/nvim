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
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm i'  }

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
