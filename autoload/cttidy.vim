let s:cttidy_defaults = {'char': '',  'tools': {}}
let s:cttidy_configuration = s:cttidy_defaults
let s:cttidy_setup = 0

function! cttidy#for_range(start, end, command, ...)
	let winview = winsaveview()
	let text = ":"
	" Optional prefix.  Can be used for :silent
	if a:0
		let text .= a:1 . " "
	endif
	let text .= a:start . "," . a:end . a:command
	execute text
	call winrestview(winview)
endfunction

function! cttidy#tidy(start, end)
	call cttidy#setup()
	let tools = s:cttidy_configuration['tools']
	let cmd = "cat"
	if has_key(tools, &ft)
		let cmd = tools[&ft]
	endif
	call cttidy#for_range(a:start, a:end, "!" . cmd)
endfunction

function! cttidy#setup()
	if s:cttidy_setup
		return
	endif
	"try
		call cttidy#themes#{g:cttidy_theme}#load_theme()
		let s:cttidy_setup = 1
	"catch
	"endtry
endfunction

function! cttidy#set_theme(theme)
	let s:cttidy_configuration = a:theme
	if s:cttidy_configuration['char'] != ''
		exe 'noremap ' . s:cttidy_configuration['char'] . ' :CTTidy<CR>'
	endif
endfunction

function! cttidy#configuration()
	return s:cttidy_configuration
endfunction
