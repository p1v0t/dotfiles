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

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim' | Plug 'roxma/nvim-yarp'| Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/neosnippet.vim'
Plug 'p1v0t/neosnippet-snippets'

Plug 'Shougo/neoinclude.vim'
Plug 'jsfaint/coc-neoinclude'
Plug 'neoclide/coc.nvim', {'do': 'yarn install'}

Plug 'https://github.com/w0rp/ale'
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }

Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'https://github.com/tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim'

Plug 'mileszs/ack.vim'
Plug 'rhysd/vim-clang-format', {'for' : ['c', 'cpp']}

Plug 'google/vim-maktaba', {'for' : ['c', 'cpp']}
Plug 'bazelbuild/vim-bazel', {'for' : ['c', 'cpp']}

call plug#end()

" pluginsVariables {{{

" coc-settings {{{

let g:deoplete#enable_at_startup = 1

let g:coc_status_error_sign = 'E'
let g:coc_status_warning_sign = 'W'

let g:coc_filetype_map = {
     \ 'cc': 'cpp',
	 \'hpp' : 'cpp',
	 \'C' : 'cpp'
	 \}

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

imap <expr><CR>
\ (pumvisible() && neosnippet#expandable()) ?
\ "\<Plug>(neosnippet_expand)" : "\<CR>"

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

inoremap <silent><expr> <c-space> coc#refresh()

nnoremap t <Plug>(coc-type-definition)
nnoremap n <Plug>(coc-implementation)

nnoremap <leader>w <Plug>(coc-definition) 
nnoremap <leader>n <Plug>(coc-declaration)

nnoremap <leader>i <Plug>(coc-diagnostic-info) 
nnoremap <leader>n <Plug>(coc-diagnostic-next)
nnoremap <leader>p <Plug>(coc-diagnostic-prev)
nnoremap <leader>f <Plug>(coc-action-fold)

nnoremap <F2> <Plug>(coc-rename)

nnoremap <leader>gh <Plug>(coc-references)
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
let g:NERDMinimalMenu=1
" }}}

" airline {{{
let g:airline_theme='dracula'
"let g:airline_exclude_filetypes = []

" }}}

" ack {{{
let g:ackprg = 'ag --vimgrep'
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