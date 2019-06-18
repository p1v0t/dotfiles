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

nnoremap <silent> <F5> :w <bar> !clear && g++
"	\ -fsyntax-only
    \ -Wall
    \ -Wextra
	\ -Wshadow
	\ -Wpedantic 
	\ -fconcepts
	\ -Woverloaded-virtual 
	\ -Wdeprecated
	\ -Wconversion 
	\ -Wold-style-cast
	\ -Wnon-virtual-dtor
	\ -std=gnu++2a % && ./a.out <CR>

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


let g:clang_include_fixer_path='/usr/bin/clang-include-fixer-7'
let g:clang_include_fixer_maximum_suggested_headers=5
let g:clang_include_fixer_increment_num=5
let g:clang_include_fixer_jump_to_include=0
let g:clang_include_fixer_query_mode=0
noremap <leader>ff :py3f /usr/bin/clang-include-fixer.py<cr>

" vim-clang-format {{{
let g:clang_format#command='clang-format'
let g:clang_format#code_style='llvm'
let g:clang_format#detect_style_file=1
let g:clang_format#auto_format=1 
" }}}

