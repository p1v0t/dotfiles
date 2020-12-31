syntax on

" vim-clang-format {{{
let g:clang_format#command='clang-format-11'
let g:clang_format#code_style='llvm'
let g:clang_format#detect_style_file=1
let g:clang_format#auto_format=1 
let g:clang_format#style_options = {
		   	\ 'AlwaysBreakTemplateDeclarations':'Yes',
		   	\ 'SortIncludes':'false',
		   	\ 'SortUsingDeclarations':'false',
            \ }
" }}}

" ALE {{{
let g:ale_cpp_clang_executable=''
let g:ale_cpp_clang_options=["-std=c++2a"]
let g:ale_cpp_clangd_executable=''
let g:ale_cpp_clangd_options=["--compile-commands-dir=build",
			\ "--all-scopes-completion",
			\    "--header-insertion=never",
			\    "--background-index",
			\    "--completion-parse=always",
			\    "--completion-style=bundled",
			\    "--function-arg-placeholders",
			\    "--limit-results=0",
			\    "-j=1",
			\    "--pch-storage=memory",
			\    "--log=verbose",
			\    "--pretty"]


let g:ale_cpp_clangcheck_executable='clang-check-11'
let g:ale_cpp_clangtidy_executable='clang-tidy-11'
let g:ale_cpp_clangtidy_checks=["-checks", "*"]

let g:ale_cpp_gcc_executable='g++'
let g:ale_cpp_gcc_options='-std=c++2a'
" }}}

