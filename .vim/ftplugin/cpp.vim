syntax on
" vim-clang-format {{{
let g:clang_format#command='clang-format'
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


let g:ale_cpp_clangcheck_executable='clang-check'
let g:ale_cpp_clangtidy_executable='clang-tidy'
let g:ale_cpp_clangtidy_checks=["-checks", "-*", "bugprone-*"]

let g:ale_cpp_gcc_executable='g++-9'
let g:ale_cpp_gcc_options='-std=c++2a'
" }}}

" Single compile {{{ 
call SingleCompile#ChooseCompiler('cpp', 'clang')

nnoremap <F5> :SCCompileRunAF -g -Wall -Wextra -std=c++2a<cr>
let g:SingleCompile_showquickfixiferror = 1
let g:SingleCompile_menumode = 1
let g:SingleCompile_quickfixwindowposition = 'vertical'
let g:SingleCompile_split = 'tabe'
" }}}
