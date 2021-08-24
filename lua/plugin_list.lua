-- Plugin list
local use = require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'Mofiqul/vscode.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use 'hoob3rt/lualine.nvim'
  use 'neoclide/jsonc.vim'
  use 'norcalli/nvim-colorizer.lua'
  use 'windwp/nvim-autopairs'
  use 'terrortylor/nvim-comment'
  use 'tpope/vim-surround'
  use 'machakann/vim-highlightedyank'
  use 'lewis6991/gitsigns.nvim'
  use {
    'iamcco/markdown-preview.nvim',
    ft = {'markdown'},
    run = 'cd app && npm i',
    cmd = 'MarkdownPreview'
  }
end)
