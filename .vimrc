set nocompatible
set background=dark
set t_Co=256

if !exists("g:syntax_on")
    syntax enable
endif

set number
set ttyfast
set showcmd
set cmdheight=2
set noswapfile
set nobackup
set noerrorbells
set autowrite
set ignorecase
set ruler 
set cursorline
set colorcolumn=110
set title
set showmatch
set showmode
set mouse=v
set modifiable
set splitright
set splitbelow
set shortmess=atI
set wildmenu
set encoding=utf-8 nobomb
set binary
set noeol
set autoread
set backspace=indent,eol,start
set mousehide
set spelllang=en_US
set fileformat=unix
set autoread
set comments=sl:/*,mb:\ *,elx:\ */

let mapleader = " "

augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

augroup DragQuickfixWindowDown
    autocmd!
    autocmd FileType qf wincmd J
augroup END

" quick shot, compile and run
au filetype cpp nnoremap <silent> <F5> :w <bar> !clear && clang++
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

au filetype cpp nnoremap <silent> <F6> :!./a.out <CR>

au filetype cpp nnoremap <silent> <leader>cm :CMake<CR>
au filetype cpp nnoremap <silent> <leader>cc :CMakeClean<CR>

set makeprg=ninja\ -C\ ./build
au filetype cpp nnoremap <silent> <F4> :make! <CR>

au filetype cpp nnoremap <silent> ft :!clear && clang-tidy -checks='*'
			\-fix -fix-errors % -- -std=c++1z <CR>
 
inoremap jk <ESC>
nnoremap - :

nnoremap <silent> <leader>ve :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>vs :w <bar> source $MYVIMRC<CR>

nnoremap <silent> <leader>be :vsplit ~/.bashrc<CR>

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

nnoremap <S-Enter> O <Esc>

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'dracula/vim'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'vim-syntastic/syntastic'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vhdirk/vim-cmake'
Plug 'pboettch/vim-cmake-syntax'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'
Plug 'rhysd/vim-clang-format'
Plug 'rdnetto/YCM-Generator'
Plug 'vim-airline/vim-airline'

call plug#end()

colorscheme dracula

augroup clang_format_settings
        let g:clang_format#command='clang-format'
        let g:clang_format#detect_style_file=1
augroup END

colorscheme dracula

augroup Vim-Cmake_Settings
	"g:cmake_install_prefix
	let g:cmake_build_type="RelWithDebInfo"
	let g:cmake_cxx_compiler="clang++"
	let g:cmake_c_compiler="clang"
	let g:cmake_project_generator="Ninja"
	let g:cmake_export_compile_commands=1
	let g:cmake_ycm_symlinks=1
augroup END

augroup nerdtree_settings
	let g:NERDTreeWinPos='right'
	let g:NERDTreeWinSize=20
	let g:NERDTreeShowHidden=1
	noremap <leader>nn :NERDTreeToggle<cr>
augroup END

augroup ale_Settings
	let g:ale_lint_on_text_changed=1

	let ale_c_build_dir_names=['build','Build','bin']
	let ale_c_build_dir='build'

	let g:ale_cpp_clang_executable='clang'
	let g:ale_cpp_clang_options='-Wall -Wshadow -Wnon-virtual-dtor
            \ -Wpedantic -Woverloaded-virtual -Wdeprecated -Wconversion
            \-Wold-style-cast -Wnon-virtual-dtor -Weffc++ -std=c++17'

	let g:ale_cpp_clangd_executable='clangd'
	let g:ale_cpp_clangd_option=''

	let g:ale_cpp_clangcheck_executable='clang-check'
	let g:ale_cpp_clangcheck_options=''

	let g:ale_c_clangformat_executable='clang-format'
	let g:ale_c_clangformat_options='.clang-format'

	let g:ale_c_clangtidy_executable='clang-tidy'
        let g:ale_c_clangtidy_checks=['*']

	let g:ale_cpp_clangtidy_executable='clang-tidy'
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
augroup END

augroup ycm_settings
        let g:ycm_confirm_extra_conf=0
	let g:ycm_error_symbol='oO'
	let g:ycm_warning_symbol=':('
augroup END

augroup ultisnip_settings
	let g:UltiSnipsEditSplit='vertical'
	let g:UltiSnipsEnableSnipMate=1

	let g:UltiSnipsExpandTrigger="<c-j>"
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"
augroup END

augroup airline_settings
	let g:airline#extensions#ycm#enabled=1
	let g:airline#extensions#ycm#error_symbol='E:'
	let g:airline#extensions#ycm#warning_symbol='W:'
        let g:airline_theme='dracula'
  	"let g:airline_exclude_filetypes = []
augroup END

let g:clang_include_fixer_path="clang-include-fixer"
let g:clang_include_fixer_maximum_suggested_headers=3
let g:clang_include_fixer_increment_num=5
let g:clang_include_fixer_jump_to_include=0

au BufWinLeave ?* mkview 1
au BufWinLeave ?* silent loadview 1
