let s:cttidy_defaults = {
	\'char': '<Leader>b',
	\'tools': {
		\'perl': 'perltidy -q',
		\'javascript': '/usr/local/cpanel/3rdparty/node/bin/js-beautify -f -',
		\'python': 'pythontidy',
		\'go': 'gofmt',
		\'rust': 'rustfmt',
	\}
\}

function! cttidy#themes#bmc#load_theme()
	call cttidy#set_theme(s:cttidy_defaults)
endfunction
