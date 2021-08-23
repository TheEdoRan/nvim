-- Plugins setup
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