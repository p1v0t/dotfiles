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
"set spell

let mapleader = " "

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

 augroup reload_vimrc
	 autocmd!
	 autocmd BufWritePost $MYVIMRC source $MYVIMRC
 augroup end

" --------------------------------------------------------"
" Mappings                                                "
" --------------------------------------------------------"

imap <Tab-j>  <CR-j>
inoremap jk <ESC>

au filetype cpp nnoremap <silent> ft :!clear && clang-tidy-8 -checks='*' -fix -fix-errors % -- -std=c++1z <CR>
 
nnoremap <silent> <leader>ve :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>vs :source $MYVIMRC<CR>

nnoremap <silent> <leader>be :vsplit ~/.bashrc<CR>
nnoremap <silent> <leader>et :vsplit ~/.tmux.conf<CR>

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

nnoremap <S-Enter> O <Esc>

"insert modda yukarı aşşağı
inoremap <C-Y> <C-X><C-Y>
inoremap <C-E> <C-X><C-E>


nnoremap <silent> <leader>cm :CMake<CR>
nnoremap <silent> <leader>cc :CMakeClean<CR>

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
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
Plugin 'rhysd/vim-clang-format'
Plugin 'python-mode/python-mode'
Plugin 'rdnetto/YCM-Generator'

call vundle#end()

 
let g:clang_format#command='clang-format-8'

colorscheme dracula

augroup Vim-Cmake_Settings
	"g:cmake_install_prefix
	let g:cmake_build_type="RelWithDebInfo"
	let g:cmake_cxx_compiler="clang++-8"
	let g:cmake_c_compiler="clang-8"
	let g:cmake_project_generator="Unix Makefiles"
	let g:cmake_export_compile_commands=1
	let g:cmake_ycm_symlinks=1
augroup END

augroup nerdtree_settings
	let g:NERDTreeWinPos='right'
	let g:NERDTreeWinSize=27
	let g:NERDTreeShowHidden=1
	map <leader>nn :NERDTreeToggle<cr>

augroup END

augroup ale_Settings
	let g:ale_lint_on_text_changed=1

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
        let g:ale_c_clangtidy_checks=[ -'modernize-use-equals-delete']
	let g:ale_cmake_cmakelint_executable='/usr/local/bin/cmakelint'
	let g:ale_cmake_cmakelint_options='--filter=linelength package/consistency +readability/+logic whitespace/+eol' 

augroup END

augroup ycm_settings
augroup END

augroup ultisnip_settings
	let g:UltiSnipsExpandTrigger="<c-j>"
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"
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