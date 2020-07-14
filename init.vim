" Always load base config
runtime! config/base.vim

" If vim-plug download folder is empty, proceed to install it.
if empty(glob(stdpath('data') . '/site/autoload/plug.vim'))
  call system('curl -fLo ' . stdpath('data') . '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  runtime! ./plug-list.vim
  exec 'PlugInstall | quitall'
" Otherwise, load every configuration file.
else
  runtime! ./plug-list.vim
  runtime! config/plugins.vim
  runtime! config/coc.vim
  runtime! config/lightline.vim
  runtime! config/buffers.vim
  runtime! config/fzf.vim
endif
