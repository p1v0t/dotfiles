
if has('autocmd')
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype plugin indent on

let mapleader = ' '

" mapping {{{
nnoremap ; :

nnoremap <silent>ve :edit $MYVIMRC<enter>

let g:goyo_width = 90
let g:goyo_height = 100
let g:goyo_linenr = 0
nnoremap <silent><C-f> :Goyo<enter>

nmap <silent><Leader>l :Limelight!! 0.7<enter>
xmap <silent><Leader>l :Limelight!! 0.7<enter>

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

Plug 'Shougo/neoinclude.vim'
Plug 'jsfaint/coc-neoinclude'
Plug 'neoclide/coc.nvim', {'for':['zig','cmake','rust',
			\'java','json', 'haskell', 'ts','sh',
			\'yaml', 'c', 'cpp', 'd', 'go',
			\'python', 'dart', 'javascript', 'vim'], 
			\'do': { -> coc#util#install()}}

Plug 'rust-lang/rust.vim', {'for' : ['rust']}
Plug 'ziglang/zig.vim', {'for' : ['zig']}
Plug 'dense-analysis/ale', {'for' : ['sh', 'vim', 'javascript']}
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go', { 'for': ['go'], 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'

Plug 'vim-scripts/SingleCompile'
Plug 'wincent/command-t'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'ollykel/v-vim', {'for' : ['v']}

Plug 'itchyny/lightline.vim',{'frozen': 1}
Plug 'dracula/vim',{'frozen': 1}
Plug 'NLKNguyen/papercolor-theme',{'frozen': 1}

Plug 'mileszs/ack.vim',{'frozen': 1}
Plug 'rhysd/vim-clang-format', {'for' : ['c', 'cpp']}

Plug 'mattn/emmet-vim' , {'for' : ['html', 'css']}

call plug#end()

" pluginsVariables {{{

"coc-settings {{{

inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()


inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

map rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

let g:lightline = {
      \'colorscheme': 'PaperColor',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}

" airline {{{
let g:airline_theme='dracula'
let g:airline_exclude_filetypes = ['md']
" }}}

" ale {{{
let g:ale_cpp_gcc_options='-std=c++2a -Wpedantic -Wall -Wextra -fconcepts'
let ale_c_build_dir='build'
let g:ale_c_build_dir_names=['build', 'bin']
let g:ale_cpp_cpplint_options='quite'
" }}}


" ack {{{
let g:ackprg = 'ag --vimgrep'
" }}}

" variables {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

set hlsearch
set incsearch
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c 
set signcolumn=yes
set smarttab
set nonumber
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
set noshowmode
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
set autowrite
set laststatus=2
set termwinsize=10*0
" }}}

set background=dark
colorscheme PaperColor