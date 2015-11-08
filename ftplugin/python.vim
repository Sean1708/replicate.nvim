if executable('ipython3')
  let s:prog = 'ipython3'
elseif executable('ipython')
  let s:prog = 'ipython'
elseif executable('python3')
  let s:prog = 'python3'
else
  let s:prog = 'python'
endif

let b:replicate = [s:prog, s:prog . ' -i %']
