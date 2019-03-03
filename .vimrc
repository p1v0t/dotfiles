if !exists('g:syntax_on')
    syntax enable
endif

if has('autocmd')
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

filetype plugin indent on

let mapleader = ' '

set runtimepath+=/home/adem/Desktop/MarkdownComment/

augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" mapping {{{
nnoremap - :
nnoremap <silent> <leader>ve :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>vs :w <bar> source $MYVIMRC<CR>
nnoremap <silent> <leader>be :vsplit ~/.bashrc<CR>
nnoremap <silent> <leader>bs :!source ~/.bashrc<CR>

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
Plug 'fatih/vim-go'
Plug 'pboettch/vim-cmake-syntax'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer'}
Plug 'SirVer/ultisnips'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'p1v0t/vim-snippets'
Plug 'rhysd/vim-clang-format'
Plug 'vim-airline/vim-airline'
Plug 'richq/vim-cmake-completion'
Plug 'lervag/vimtex'
Plug 'OmniSharp/omnisharp-vim'
Plug 'mileszs/ack.vim'
Plug 'CoatiSoftware/vim-sourcetrail'
Plug 'tell-k/vim-autopep8'

call plug#end()

" pluginsVariables {{{
" vimtex {{{
let g:tex_flavor = 'XeTeX'

if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
" }}}
"
" nerdtree {{{
let g:NERDTreeWinPos='right'
let g:NERDTreeWinSize=20
let g:NERDTreeShowHidden=1
" }}}

" ale {{{
let g:ale_sign_error = 'Oo'
let g:ale_sign_warning = '):'
let g:ale_lint_on_text_changed=1
" }}}
"
" youcompleteme {{{
let g:ycm_confirm_extra_conf=0
let g:ycm_error_symbol='oO'
let g:ycm_warning_symbol=':('
" }}}

" ultisnip {{{
"let g:UltiSnipsSnippetDirectories=['UltiSnips','myPlugins']
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/vim-snippets/UltiSnips']
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsEnableSnipMate=1

let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
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

" vim-autopep
" nothing for now
" }}}


" }}}
" }}}
" }}}

" variables {{{
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
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
set backspace=indent,eol,start
set wildmenu
set encoding=utf-8 nobomb
set binary
"set noendofline
set autoread
set mousehide
set spelllang=en_US
set fileformat=unix
set autoread
" }}}

colorscheme dracula