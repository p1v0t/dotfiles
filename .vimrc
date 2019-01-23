if !exists("g:syntax_on")
    syntax enable
endif

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

filetype plugin indent on

let mapleader = " "
let maplocalleader = ","

augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" mapping {{{
nnoremap - :
nnoremap <silent> <leader>ve :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>vs :w <bar> source $MYVIMRC<CR>
nnoremap <silent> <leader>be :vsplit ~/.bashrc<CR>
noremap <leader>nn :NERDTreeToggle<cr>

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
" }}}

" plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'dracula/vim'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vhdirk/vim-cmake'
Plug 'pboettch/vim-cmake-syntax'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'honza/vim-snippets'
Plug 'rhysd/vim-clang-format'
Plug 'rdnetto/YCM-Generator'
Plug 'vim-airline/vim-airline'
Plug 'richq/vim-cmake-completion'
Plug 'lervag/vimtex'
Plug 'kien/rainbow_parentheses.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'mileszs/ack.vim'


call plug#end()

" pluginsVariables {{{
" vimtex {{{
let g:tex_flavor = 'XeTeX'

if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" }}}
" rainbow_brakets {{{
let g:rbpt_max=16
let g:rbpt_loadcmd_toggle=1

let g:rbpt_colorpairs=[
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
" }}}

" vim-clang-format {{{
let g:clang_format#command='clang-format'
let g:clang_format#detect_style_file=1
" }}}

" vim-cmake {{{
"let g:cmake_install_prefix
let g:cmake_build_type="RelWithDebInfo"
let g:cmake_cxx_compiler="clang++"
let g:cmake_c_compiler="clang"
let g:cmake_project_generator="Unix Makefiles"
let g:cmake_export_compile_commands=1
let g:cmake_ycm_symlinks=1
" }}}

" nerdtree {{{
let g:NERDTreeWinPos='right'
let g:NERDTreeWinSize=20
let g:NERDTreeShowHidden=1
" }}}

" ale {{{
let g:ale_lint_on_text_changed=1

let ale_c_build_dir_names=['build','Build','bin', '../build', '../Build']
let ale_c_build_dir='../build'

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
" }}}
"
" youcompleteme {{{
let g:ycm_confirm_extra_conf=0
let g:ycm_error_symbol='oO'
let g:ycm_warning_symbol=':('
" }}}

" ultisnip {{{
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsEnableSnipMate=1

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}

" airline {{{
let g:airline#extensions#ycm#enabled=1
let g:airline#extensions#ycm#error_symbol='E:'
let g:airline#extensions#ycm#warning_symbol='W:'
let g:airline_theme='dracula'
"let g:airline_exclude_filetypes = []

" vim-latex-live-preview {{{
let g:livepreview_engine='evince'
let g:livepreview_cursorhold_recompile=1
" }}}

let g:ackprg = 'ag --vimgrep'

" }}}
" }}}
" }}}

" variables {{{
set tabstop=8
set shiftwidth=8
set smarttab
set expandtab
set nocompatible
set number
set ttyfast
set showcmd
set cmdheight=1
set swapfile
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
" }}}

colorscheme dracula