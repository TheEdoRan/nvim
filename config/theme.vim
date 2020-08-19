" Theme
" Enable true colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set t_Co=256
set t_ut=

"let g:onedark_color_overrides = {
"\ "comment_grey": { "gui": "#808080", "cterm": "244", "cterm16": "5" },
"\ "gutter_fg_grey": { "gui": "#5D5D5D", "cterm": "244", "cterm16": "5" },
"\ "blue": { "gui": "#E8A14A", "cterm": "244", "cterm16": "5" },
"\ "red": { "gui": "#55BBF5", "cterm": "244", "cterm16": "5" },
"\ "cyan": { "gui": "#CFCA3D", "cterm": "244", "cterm16": "5" }
"\}

"colorscheme onedark
colorscheme codedark

" Cursor line highlight color
highlight CursorLine guibg=#363636
