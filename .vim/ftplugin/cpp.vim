syntax off
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
let g:ale_cpp_clang_executable='clang++'
let g:ale_cpp_clangd_executable='clangd'
let g:ale_cpp_clangcheck_executable='clang-check'
let g:ale_cpp_clangtidy_executable='clang-tidy'
let g:ale_cpp_clangtidy_checks=["-checks", "-*", "bugprone-*"]

let g:ale_cpp_gcc_executable='g++-9'
let g:ale_cpp_gcc_options='-std=c++2a'
" }}}


" clang-include-fixer {{{
let g:clang_include_fixer_path = "clang-include-fixer"
let g:clang_include_fixer_maximum_suggested_headers = 3
let g:clang_include_fixer_increment_num = 5
let g:clang_include_fixer_jump_to_include = 0
let g:clang_include_fixer_query_mode = 0
noremap <leader>cf :pyf /home/adem/Desktop/projects/llvm-project/clang-tools-extra/clang-include-fixer/tool/clang-include-fixer.py<enter>
" }}}

" Single compile {{{ 
nnoremap <F5> :SCCompileRunAF -g -Wall -Wextra -std=c++2a<cr>
let g:SingleCompile_showquickfixiferror = 1
let g:SingleCompile_menumode = 1
let g:SingleCompile_quickfixwindowposition = 'vertical'
let g:SingleCompile_split = 'tabe'
" }}}
