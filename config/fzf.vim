" Config
let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'zenburn'
let g:fzf_preview_directory_files_command = 'rg --files --hidden --follow --no-messages --glob "!.git/*" --glob "!node_modules/*"'

nnoremap <silent> <C-p> :<C-u>CocCommand fzf-preview.DirectoryFiles <CR>
nnoremap <silent> <C-f> :<C-u>CocCommand fzf-preview.ProjectGrep ""<CR>
nnoremap <silent> <C-g> :<C-u>CocCommand fzf-preview.GitStatus <CR>
nnoremap <silent> <C-q> :<C-u>CocCommand fzf-preview.BufferLines <CR>
