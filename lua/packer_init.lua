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

