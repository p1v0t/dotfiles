setlocal autoread
setlocal autowrite
setlocal background=dark
setlocal backspace
setlocal writebackup

setlocal belloff=all
setlocal cmdheight=2
setlocal tabstop=8
setlocal nocindent
setlocal shiftwidth=8
setlocal expandtab
setlocal autoindent
setlocal smarttab
setlocal makeprg=make

nnoremap <silent> <F5> :w <bar> !clear && g++
	\ -Wshadow
	\ -Wnon-virtual-dtor
	\ -Wpedantic 
	\ -Woverloaded-virtual 
	\ -Wdeprecated
	\ -Wconversion 
        \ -Wold-style-cast
	\ -Wnon-virtual-dtor
	\ -Weffc++
	\ -std=c++17 -O2 %  && ./a.out <CR>

nnoremap <silent> <F6> :!./a.out <CR>

nnoremap <silent> <C-m> :CMake<CR>
nnoremap <silent> <C-b> :make! <CR>
nnoremap <silent> <C-c> :CMakeClean<CR>
nnoremap <silent> ft :!clear && clang-tidy -checks='*'
			\-fix -fix-errors % -- -std=c++1z <CR>