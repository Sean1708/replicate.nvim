call replicate#Default('g:replicate_split_window', 1)
call replicate#Default('g:replicate_min_winwidth', 80)

command! -bang REPL call replicate#REPL(<bang>1)
