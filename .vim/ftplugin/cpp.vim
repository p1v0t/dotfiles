setlocal autoread
setlocal autowrite
setlocal background=dark
setlocal backspace=indent,eol,start
setlocal writebackup

setlocal belloff=all
"setlocal cmdheight=2
"setlocal tabstop=4
"setlocal shiftwidth=4
setlocal nocindent
setlocal expandtab
setlocal autoindent
setlocal smarttab
setlocal makeprg=make

fun! CompileWithGCC()
	let compiler = 'g++'
	let standard = '-std=c++17'
	let defaultFlags = ['-fsyntax-only', '-Wshadow',
				\ '-Wpedantic', '-Woverloaded-virtual',
				\ '-Wdeprecated', '-Wconversion', '-Wold-style-cast',
				\'-Wnon-virtual-dtor', '-std=c++17']
	" noncomplete
endf

nnoremap <silent> <F5> :w <bar> !clear && g++
	\ -fsyntax-only
	\ -Wshadow
	\ -Wpedantic 
	\ -Woverloaded-virtual 
	\ -Wdeprecated
	\ -Wconversion 
	\ -Wold-style-cast
	\ -Wnon-virtual-dtor
	\ -std=c++17  % <CR>

nnoremap <silent> <F6> :w <bar> !clear && clang++
	\ -stdlib=libc++
	\ -Wshadow
	\ -Wpedantic 
	\ -Woverloaded-virtual 
	\ -Wdeprecated
	\ -Wconversion 
	\ -Wold-style-cast
	\ -Wnon-virtual-dtor
	\ -std=c++17 -O2 %  && ./a.out <CR>

"call coc#config('coc.preferences', {
"		\ 'timeout': 1000,
"		\ 'hoverTarget': 'echo',
"		\ 'languageserver': {
"		\   'ccls': {
"		\     "command": "ccls",
"      		\     "trace.server": "verbose",
"      		\     "filetypes": ["c", "cpp", "objc", "objcpp"]
"		\   }
"		\ }
"\})

"function! cmakebuild()
"	let buildpath = ["build", "Build"]
"	let srcPath = ["."]
"	echom "build began"
"	system("cmake -Bbuildpaths[0] -S  srcPath[0]")
"	system ("cmake --build buildpath[0]")
"endfunction


let g:clang_include_fixer_path='/usr/bin/clang-include-fixer-7'
let g:clang_include_fixer_maximum_suggested_headers=5
let g:clang_include_fixer_increment_num=5
let g:clang_include_fixer_jump_to_include=0
let g:clang_include_fixer_query_mode=0
noremap <leader>ff :py3f /usr/bin/clang-include-fixer.py<cr>

" vim-clang-format {{{
let g:clang_format#command='clang-format'
let g:clang_format#code_style='chromium'
let g:clang_format#detect_style_file=1
let g:clang_format#auto_format=1 
" }}}

