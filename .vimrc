set nocompatible
set background=dark
set t_Co=256

filetype off
filetype plugin indent on
syntax on

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
"set spell

let mapleader = " "

augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

augroup DragQuickfixWindowDown
    autocmd!
    autocmd FileType qf wincmd J
augroup END

" --------------------------------------------------------"
" Mappings                                                "
" --------------------------------------------------------"

" quick shot, compile and run
au filetype cpp nnoremap <silent> <F5> :w <bar> !clear && clang++-8
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

" just run
au filetype cpp nnoremap <silent> <F6> :!./a.out <CR>

" CMake
au filetype cpp nnoremap <silent> <leader>cm :CMake<CR>
au filetype cpp nnoremap <silent> <leader>cc :CMakeClean<CR>

" make
set makeprg=make\ -C\ build
au filetype cpp nnoremap <silent> <F4> :make! <CR>

au filetype cpp nnoremap <silent> ft :!clear && clang-tidy-8 -checks='*' -fix -fix-errors % -- -std=c++1z <CR>
 
inoremap jk <ESC>

nnoremap <silent> <leader>ve :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>vs :source $MYVIMRC<CR>

nnoremap <silent> <leader>be :vsplit ~/.bashrc<CR>
nnoremap <silent> <leader>et :vsplit ~/.tmux.conf<CR>

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

"insert modda yukarı aşağı
inoremap <C-Y> <C-X><C-Y>
inoremap <C-E> <C-X><C-E>

" --------------------------------------------------------"
" Paths                                                   "
" --------------------------------------------------------"

set rtp+=~/.vim/bundle/Vundle.vim

" --------------------------------------------------------"
" Plugins                                                 "
" --------------------------------------------------------"

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'dracula/vim'
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-surround'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vhdirk/vim-cmake'
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
Plugin 'rhysd/vim-clang-format'
Plugin 'python-mode/python-mode'
Plugin 'rdnetto/YCM-Generator'
Plugin 'vim-airline/vim-airline'

call vundle#end()

augroup clang_format_settings
        let g:clang_format#command='clang-format-8'
        let g:clang_format#detect_style_file=1
augroup END

colorscheme dracula

augroup Vim-Cmake_Settings
	"g:cmake_install_prefix
	let g:cmake_build_type="RelWithDebInfo"
	let g:cmake_cxx_compiler="clang++-8"
	let g:cmake_c_compiler="clang-8"
	let g:cmake_project_generator="Ninja"
	let g:cmake_export_compile_commands=1
	let g:cmake_ycm_symlinks=1
augroup END

augroup nerdtree_settings
	let g:NERDTreeWinPos='right'
	let g:NERDTreeWinSize=27
	let g:NERDTreeShowHidden=1
	noremap <leader>nn :NERDTreeToggle<cr>

augroup END

augroup ale_Settings
	let g:ale_lint_on_text_changed=1

	let ale_c_build_dir_names=['build','Build','bin']
	let ale_c_build_dir='build'

	let g:ale_cpp_clang_executable='clang-8'
	let g:ale_cpp_clang_options='-Wall -Wshadow -Wnon-virtual-dtor
            \ -Wpedantic -Woverloaded-virtual -Wdeprecated -Wconversion 
            \-Wold-style-cast -Wnon-virtual-dtor -Weffc++ -std=c++17'

	let g:ale_cpp_clangd_executable='clangd-8'
	let g:ale_cpp_clangd_option=''

	let g:ale_cpp_clangcheck_executable='clang-check-8'
	let g:ale_cpp_clangcheck_options=''

	let g:ale_c_clangformat_executable='clang-format-8'
	let g:ale_c_clangformat_options='.clang-format'

	let g:ale_c_clangtidy_executable='clang-tidy-8'
        let g:ale_c_clangtidy_checks=['modernize-use-equals-delete']

	let g:ale_cpp_clangtidy_executable='clang-tidy-8'
	let g:ale_cpp_clangtidy_checks=['bugpron-*','cert-*','cppcoreguidelines-*','google-*', 'hicpp-*', 'llvm-*','misc-*','modernize-*', 'performance-*', 'readability-*']

	let g:ale_cmake_cmakelint_executable='/usr/local/bin/cmakelint'
	let g:ale_cmake_cmakelint_options='--filter=linelength package/consistency +readability/+logic whitespace/+eol' 
augroup END

augroup ycm_settings
augroup END

augroup ultisnip_settings
	let g:UltiSnipsUsePythonVersion=2
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
augroup END

augroup python_mode_settings
	let g:pymode=0
	let g:pymode_motion=0
	let g:pymode_python='python3'
	let g:pymode_lint_unmodified=1
augroup END

map <leader>ff :pyf /home/adem/Desktop/test/post/clang-include-fixer.py<cr>

let g:clang_include_fixer_path="usr/bin/clang-include-fixer-8"
let g:clang_include_fixer_maximum_suggested_headers=3
let g:clang_include_fixer_increment_num=5
let g:clang_include_fixer_jump_to_include=0

au BufWinLeave ?* mkview 1
au BufWinLeave ?* silent loadview 1