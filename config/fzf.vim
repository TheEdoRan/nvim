" Config
let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'zenburn'
let g:fzf_preview_directory_files_command = 'rg --files --hidden --follow --no-messages --glob "!.git/*" --glob "!node_modules/*"'

nnoremap <silent> <C-M-p> :<C-u>CocCommand fzf-preview.DirectoryFiles <CR>
nnoremap <silent> <C-M-f> :<C-u>CocCommand fzf-preview.ProjectGrep ""<CR>
nnoremap <silent> <C-M-g> :<C-u>CocCommand fzf-preview.GitStatus <CR>
nnoremap <silent> <C-M-q> :<C-u>CocCommand fzf-preview.BufferLines <CR>
