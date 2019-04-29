if !exists('g:syntax_on')
    syntax enable
endif

if has('autocmd')
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype plugin indent on

let mapleader = ' '

" mapping {{{
nnoremap <silent>ve :vsplit ~/.vimrc<CR>
nnoremap <silent>vs :w <bar> source ~/.vimrc<CR>

nnoremap <silent> <leader>fe :vsplit ~/.config/fish/config.fish <CR>
nnoremap <silent> <leader>fs :!source ~/.config/fish/config.fish <CR>

noremap <leader>nn :NERDTreeToggle<cr>
noremap cf <Plug>(operator-clang-format)

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

Plug 'Shougo/neoinclude.vim'
Plug 'jsfaint/coc-neoinclude'
Plug 'neoclide/coc.nvim', {'for':['c', 'cpp', 'd', 'go', 'python', 'dart'], 'do': { -> coc#util#install()}}

Plug 'Shougo/neosnippet.vim'
Plug 'p1v0t/neosnippet-snippets'

Plug 'https://github.com/w0rp/ale'
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }

Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'https://github.com/tpope/vim-fugitive'

Plug 'scrooloose/nerdtree',{'frozen': 1}
Plug 'itchyny/lightline.vim',{'frozen': 1}
Plug 'dracula/vim',{'frozen': 1}

Plug 'mileszs/ack.vim'
Plug 'rhysd/vim-clang-format', {'for' : ['c', 'cpp']}

Plug 'google/vim-maktaba', {'for' : ['c', 'cpp']}
Plug 'bazelbuild/vim-bazel', {'for' : ['c', 'cpp']}

call plug#end()

" pluginsVariables {{{

" neosnippet-snippets

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" }}}

" coc-settings {{{
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
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
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c 
set signcolumn=yes
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
set laststatus=2
" }}}

let g:go_def_mode='gopls'

colorscheme dracula