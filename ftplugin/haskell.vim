" TODO: is there a command line argument to load a source file?
" TODO: UNTESTED
if executable('stack')
  let s:prog = 'stack ghci'
else
  let s:prog = 'ghci'
endif

let b:replicate = s:prog
