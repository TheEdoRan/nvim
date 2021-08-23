-- Plugin list
local use = require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'Mofiqul/vscode.nvim'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'neoclide/jsonc.vim'
  use 'norcalli/nvim-colorizer.lua'
  use 'windwp/nvim-autopairs'
  use 'terrortylor/nvim-comment'
  use 'machakann/vim-highlightedyank'
  use {
    'iamcco/markdown-preview.nvim',
    ft = {'markdown'},
    run = 'cd app && npm i',
    cmd = 'MarkdownPreview'
  }
end)
