
function! RunNormalAndInsert(normal_cmd)
	execute "normal " . a:normal_cmd
	startinsert
endfunction

function! SearchWithPattern(searchPattern)
	let s:result = search(a:searchPattern, 'W')
	return s:result
endfunction

command! TldrNext call SearchWithPattern('{{.\{-}}}')

function! FixTldrPattern()
	execute "normal vf}ld"
	startinsert
endfunction

command! TldrFix call FixTldrPattern()

function! IsOnPlaceholder()
	execute "normal vf}loy"
	execute "normal! `<v`>y"

	let current = getreg('@@')
	let placeholder = matchstr(current, '^{{.\{-}}}')

	if empty(placeholder) 
		return 0
	else
		return 1
	endif
endfunction

function! CountMatches(word)
	let s:v =  winsaveview()
	let s:cnt=''

	redir => s:cnt
		silent! exe '%s/' . a:word . '//n'
	redir END

	call winrestview(s:v)
	
	let s:count =  matchstr(trim(s:cnt), '^\d\+')

	if len(s:count) == 0
		return 0
	else
		return s:count
	endif 
	
endfunction

function! SearchAndReplaceThenNextPattern()
	let on_placeholder = IsOnPlaceholder()
	
	if on_placeholder == 0
		let s:found = SearchWithPattern('{{.\{-}}}')
	endif
	
	if s:found == 0
		return
	endif
	
	let cword = expand('<cword>')
	
	let s:count = CountMatches('{{' . cword . '}}')
	
	if s:count > 1
		let s:mode = '/gc'
	else
		let s:mode = ''
	endif
	
	exe 'noh'
	call clearmatches()
	call matchadd('Search', cword)
	redraw!
	let s:v =  winsaveview()
	
	let userInput = input(':%s/\<' . cword . '\>/')
	if len(userInput) > 0 && s:count != 0
		silent! exe '%s/{{' . cword . '}}/' . userInput . s:mode
	endif
	
	call winrestview(s:v)
	
	call SearchWithPattern('{{.\{-}}}')
	call clearmatches()
	exe 'noh'
endfunction

function! SearchAndReplaceAll()
	
	let s:count = CountMatches('{{.\{-}}}')
	
	while s:count > 0
		call SearchAndReplaceThenNextPattern()
		
		let s:count = CountMatches('{{.\{-}}}')
		if s:count == 0
			:echo ":TldrFixAll"
		endif
	endwhile
endfunction

command! TldrFixAll call SearchAndReplaceAll()

