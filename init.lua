-- Packer install path
local packer_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

-- Clone packer if not found
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. packer_path)
end

-- Regenerate compiled loader file
vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

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
  use 'lambdalisue/suda.vim'
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

-- Options
vim.o.history = 1000
vim.o.hidden = true
vim.o.mouse = 'a'
vim.bo.undofile = true
vim.bo.swapfile = false
vim.o.writebackup = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmatch = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.showmode = false
vim.o.breakindent = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.scrolloff = 7
vim.o.sidescrolloff = 14
vim.o.sidescroll = 5
vim.g.python_recommended_style = false

-- Autocommands
  -- Return to last position
vim.cmd(
  [[
  autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  ]])

  -- Remove comment on next line
vim.cmd('autocmd VimEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')

-- Keymaps
local keymap_opts = { noremap = true, silent = true }

  -- If char deleted with 'x', don't put it into clipboard
vim.api.nvim_set_keymap('', 'x', '"_x', keymap_opts)
vim.api.nvim_set_keymap('', 'X', '"_x', keymap_opts)

  -- Move lines up and down with alt
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', keymap_opts)
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', keymap_opts)
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', keymap_opts)
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', keymap_opts)
vim.api.nvim_set_keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", keymap_opts)
vim.api.nvim_set_keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", keymap_opts)

-- Setup copy/paste from/to clipboard
  -- WSL platform check
if string.find(vim.fn.system('uname -r'), 'microsoft') ~= nil then
  vim.api.nvim_set_keymap('v', '<Leader>y', ":'<,'>w !clip.exe<CR><CR>", keymap_opts)
else
  vim.api.nvim_set_keymap('n', '<Leader>yy', '"+yy', keymap_opts)
  vim.api.nvim_set_keymap('v', '<Leader>y', '"+y', keymap_opts)
  vim.api.nvim_set_keymap('n', '<Leader>p', '"+p', keymap_opts)
  vim.api.nvim_set_keymap('n', '<Leader>P', '"+P', keymap_opts)
end

-- Plugins
require('nvim_comment').setup()
require('nvim-autopairs').setup()
require('colorizer').setup()
require('lualine').setup{
  options = {
    theme = 'vscode',
    section_separators = '',
    component_separators = '|'
  }
}

vim.g.vscode_style = 'dark'
vim.cmd('colorscheme vscode')

vim.g.highlightedyank_highlight_duration = 300

vim.g.mkdp_port = 42069
vim.api.nvim_set_keymap('n', '<Leader>mp', ':MarkdownPreviewToggle<CR>', keymap_opts)

vim.cmd("command WW :execute ':SudaWrite'")
