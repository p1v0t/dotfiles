if !exists('g:syntax_on')
    syntax enable
endif

if has('autocmd')
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype plugin indent on

let mapleader = ' '

" mapping {{{
nnoremap <silent> <leader>ve :vsplit ~/.vimrc<CR>
nnoremap <silent> <leader>vs :w <bar> source ~/.vimrc<CR>

nnoremap <silent> <leader>fe :vsplit ~/.config/fish/config.fish <CR>
nnoremap <silent> <leader>fs :!source ~/.config/fish/config.fish <CR>

noremap <leader>nn :NERDTreeToggle<cr>

nnoremap - :

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

Plug 'neoclide/coc.nvim', {'do': 'yarn install'}
Plug 'OmniSharp/omnisharp-vim'
Plug 'https://github.com/w0rp/ale'
Plug 'p1v0t/vim-snippets'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'https://github.com/tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim'

Plug 'rhysd/vim-clang-format'
Plug 'mileszs/ack.vim'

Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

call plug#end()

" pluginsVariables {{{

" coc-settings {{{
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? coc#rpc#request('doKeymap', ['snippets-expand-jump','']) :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

let g:coc_snippet_next = '<tab>'

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>" 

nnoremap <leader>w <Plug>(coc-diagnostic-info) 
nnoremap <leader>wn <Plug>(coc-diagnostic-next)
nnoremap <leader>wh <Plug>(coc-diagnostic-prev)

nnoremap <leader>cd <Plug>(coc-definition) 
nnoremap <leader>gh <Plug>(coc-declaration)
nnoremap <leader><F2> <Plug>(coc-rename)


"nnoremap <leader>gh <Plug>(coc-implementation)
"nnoremap <leader>gh <Plug>(coc-type-definition)
"nnoremap <leader>gh <Plug>(coc-references)
"nnoremap <leader>gh <Plug>(coc-format-selected)
"nnoremap <leader>gh <Plug>(coc-format)
"nnoremap <leader>gh <Plug>(coc-codeaction)
"nnoremap <leader>gh <Plug>(coc-codeaction-selected)
"nnoremap <leader>gh <Plug>(coc-openlink)
"nnoremap <leader>gh <Plug>(coc-fix-current)

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

let airline#extensions#coc#error_symbol = 'W'
let airline#extensions#coc#warning_symbol = 'E'
" }}}

" nerdtree {{{
let g:NERDTreeWinPos='right'
let g:NERDTreeWinSize=20
let g:NERDTreeShowHidden=1
" }}}

" airline {{{
let g:airline#extensions#ycm#enabled=1
let g:airline#extensions#ycm#error_symbol='E:'
let g:airline#extensions#ycm#warning_symbol='W:'
let g:airline_theme='dracula'
"let g:airline_exclude_filetypes = []
" }}}

" ack {{{
let g:ackprg = 'ag --vimgrep'
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
set autoread
set mousehide
set spelllang=en_US
set fileformat=unix
set autoread
" }}}

colorscheme dracula