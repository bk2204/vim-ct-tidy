let s:cttidy_defaults = {
	\'char': '<Leader>c',
	\'tools': {
		\'perl': 'perltidy -q',
		\'javascript': 'js-beautify -f -',
		\'python': 'pythontidy'
	\}
\}

function! cttidy#themes#cPanel#load_theme()
	call cttidy#set_theme(s:cttidy_defaults)
endfunction
