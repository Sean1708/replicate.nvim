function replicate#Default(name, default)
  if !exists(a:name)
    let {a:name} = a:default
  endif
endfunction

function replicate#REPL(index)
  if !exists('b:replicate')
    let l:cmd = ''
  elseif type(b:replicate) == type('')
    let l:cmd = b:replicate
  elseif type(a:index) == type('')
    let l:cmd = a:index
  else
    let l:cmd = b:replicate[a:index]
  endif

  " Expand out any instances of the current filename.
  " TODO: Maybe save to a temporary file before running?
  let l:cmd = substitute(l:cmd, '%', expand('%'), 'g')

  if g:replicate_split_window == 1
    if winwidth(0)/2 < g:replicate_min_winwidth
      botright new
    else
      vertical botright new
    endif
  endif

  if l:cmd == ''
    " `call termopen('')` leads to an immediately exited process.
    terminal
  else
    call termopen(l:cmd)
    startinsert
  endif
endfunction
