
function! RunNormalAndInsert(normal_cmd)
        execute "normal " . a:normal_cmd
        startinsert
endfunction

function! SearchWithPattern(searchPattern)
	let result = search(a:searchPattern, 'W')
endfunction

command! TldrNext call SearchWithPattern('{{.\{-}}}')

function! FixTldrPattern()
	execute "normal vf}ld"
	startinsert
endfunction

function! IsOnPlaceholder()
	execute "normal vf}lo"
	execute "normal! `<v`>y"
	let current = getreg('@@')

	let placeholder = matchstr(current, '{{.\{-}}}')

	if empty(placeholder) 
		:echo 'no ' . s:current
	else
		:echo 'yes ' . s:current
	endif
endfunction

command! TldrFix call FixTldrPattern()

