-- Keymaps
local map = vim.api.nvim_set_keymap
local keymap_opts = { noremap = true, silent = true }

  -- If char deleted with 'x', don't put it into clipboard
map('', 'x', '"_x', keymap_opts)
map('', 'X', '"_x', keymap_opts)

  -- Move lines up and down with alt
map('n', '<A-j>', ':m .+1<CR>==', keymap_opts)
map('n', '<A-k>', ':m .-2<CR>==', keymap_opts)
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', keymap_opts)
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', keymap_opts)
map('v', '<A-j>', ":m '>+1<CR>gv=gv", keymap_opts)
map('v', '<A-k>', ":m '<-2<CR>gv=gv", keymap_opts)

-- Setup copy/paste from/to clipboard
  -- WSL platform check
if string.find(vim.fn.system('uname -r'), 'microsoft') ~= nil then
  map('v', '<Leader>y', ":'<,'>w !clip.exe<CR><CR>", keymap_opts)
else
  map('n', '<Leader>yy', '"+yy', keymap_opts)
  map('v', '<Leader>y', '"+y', keymap_opts)
  map('n', '<Leader>p', '"+p', keymap_opts)
  map('n', '<Leader>P', '"+P', keymap_opts)
end

map('n', '<Leader>mp', ':MarkdownPreviewToggle<CR>', keymap_opts)

vim.cmd("command WW :execute ':SudaWrite'")