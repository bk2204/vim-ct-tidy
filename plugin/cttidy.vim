if &cp || v:version < 702 || (exists('g:loaded_cttidy') && g:loaded_cttidy)
	finish
endif
let g:loaded_cttidy = 1

if !has("user_commands")
	finish
endif

if !has(':CTTidy')
	command! -range=% CTTidy	call cttidy#tidy(<line1>, <line2>)
endif

call cttidy#setup()
