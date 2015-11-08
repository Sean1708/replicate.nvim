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
  if l:cmd =~? '%'
    " Write to temporary file (in case it's an unnamed script or has been updated since last write),
    " and use that file instead.
    let l:tempfile = tempname()
    execute 'write ' . l:tempfile
    let l:cmd = substitute(l:cmd, '%', l:tempfile, 'g')
  endif

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
