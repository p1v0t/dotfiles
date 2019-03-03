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
	\ -Wshadow
	\ -Wnon-virtual-dtor
	\ -Wpedantic 
	\ -Woverloaded-virtual 
	\ -Wdeprecated
	\ -Wconversion 
	\ -Wold-style-cast
	\ -Wnon-virtual-dtor
	\ -std=c++17 -O2 %  && ./a.out <CR>


let maplocalleader=','

nnoremap <silent><localleader> c :CMake<CR>
nnoremap <silent><localleader> m :make <CR>
nnoremap <silent> ft :!clear && clang-tidy -checks='*'
			\-fix -fix-errors % -- -std=c++1z <CR>

noremap <leader>ff :pyfile /usr/bin/clang-include.fixer.py<cr>
let g:clang_include_fixer_path='/usr/bin/clang-include-fixer-7'
let g:clang_include_fixer_maximum_suggested_headers=5
let g:clang_include_fixer_increment_num=5
let g:clang_include_fixer_jump_to_include=0
let g:clang_include_fixer_query_mode=0

" vim-clang-format {{{
let g:clang_format#command='clang-format-7'
let g:clang_format#code_style='chromium'
let g:clang_format#detect_style_file=1
let g:clang_format#auto_format=1 
" }}}

" vim-cmake {{{
"let g:cmake_install_prefix
let g:cmake_build_type='MinSizeRel'
let g:cmake_cxx_compiler='g++'
let g:cmake_c_compiler='gcc'
let g:cmake_project_generator='Unix Makefiles'
let g:cmake_export_compile_commands=1
let g:cmake_ycm_symlinks=1
" }}}

" ale {{{
let g:ale_sign_error = '->'
let g:ale_sign_warning = '):'

let g:ale_c_parse_makefile=0 
let g:ale_c_parse_compile_commands=1

let g:ale_cpp_clazy_executable='clazy'
let g:ale_cpp_clazy_checks=['level1']
let g:ale_cpp_options=''

let ale_c_build_dir_names=['build','Build','bin', '../build', '../Build']
let ale_c_build_dir='../build'

let g:ale_cpp_clangcheck_executable='clang-check-7'
let g:ale_cpp_clang_executable='clang++-7'
let g:ale_cpp_clang_options='-Wall -Wshadow -Wnon-virtual-dtor
    \ -Wpedantic -Woverloaded-virtual -Wdeprecated -Wconversion
    \ -Wold-style-cast -Wnon-virtual-dtor -Weffc++ -std=c++17'

let g:ale_cpp_cpplint_executable='cpplint'
let g:ale_cpp_clang_options='verbose=0 quite'

let g:ale_cpp_clangd_executable='clangd-7'
let g:ale_cpp_clangd_option=''

let g:ale_cpp_clangcheck_executable='clang-check-7'
let g:ale_cpp_clangcheck_options=''

let g:ale_c_clangformat_executable='clang-format-7'
let g:ale_c_clangformat_options='.clang-format'

let g:ale_c_clangtidy_executable='clang-tidy-7'
let g:ale_c_clangtidy_checks=['*']

let g:ale_cpp_clangtidy_executable='clang-tidy-7'
" hint:
" to check 'something-*`
" to disable check '-something*'
let g:ale_cpp_clangtidy_checks=['bugpron-*','cert-*',
    \'cppcoreguidelines-*','google-*', 'hicpp-*',
    \ 'llvm-*','misc-*','modernize-*', 'performance-*',
    \'readability-*', '-llvm-include-order*']

let g:ale_cmake_cmakelint_executable='/usr/local/bin/cmakelint'
let g:ale_cmake_cmakelint_options='--filter=linelength package/consistency +readability/+logic whitespace/+eol'

let g:ale_cpp_clangcheck_executable='cppcheck'

if executable('cquery')
   au User lsp_setup call lsp#register_server({
     \ 'name': 'cquery',
     \ 'cmd': {server_info->['cquery']},
     \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
     \ 'initialization_options': { 'cacheDirectory': '~/.cache/cquery' },
     \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
     \ })
endif

" }}}