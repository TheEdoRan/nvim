" Buffers
function! ExitBuffer(force_quit)
  " SPLITS
  " if windows number is greater than one (at least one split)
  " and coc-explorer is not open,
  " or windows number is greater than two (at least one split) and
  " coc explorer is open, execute Sayonara.
  if ((winnr("$") > 1 && bufwinnr("[coc-explorer") == -1) ||
        \ winnr("$") > 2 && bufwinnr("[coc-explorer") > -1)
    exec ':Sayonara'
  " ONE BUFFER
  " Otherwise, if there's only one buffer in tabline,
  elseif (len(getbufinfo({'buflisted':1})) <= 1)
    " if ! is passed, force exit.
    if a:force_quit
      exec ':q!'
      " otherwise, exit.
    else
      exec ':q'
    endif

    " In all other cases, execute Sayonara! to preserve
    " window layout.
  else
    exec ':Sayonara!'
  endif
endfunction

command! -bang -bar ExitBfr call ExitBuffer(<bang>0)

cnoreabbrev q ExitBfr
cnoreabbrev wq w<bar> ExitBfr
