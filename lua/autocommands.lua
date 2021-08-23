-- Autocommands
  -- Return to last position
vim.cmd(
  [[
  autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  ]])

  -- Remove comment on next line
vim.cmd('autocmd VimEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')