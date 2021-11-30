-- Keymaps
local map = vim.api.nvim_set_keymap
local keymap_opts = { noremap = true, silent = true }

  -- If char deleted with 'x', don't put it into clipboard
map('', 'x', '"_x', keymap_opts)
map('', 'X', '"_x', keymap_opts)

map('n', '<Leader>mp', ':MarkdownPreviewToggle<CR>', keymap_opts)
