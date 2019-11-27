" @stormpat's Vim config

call plug#begin('~/.vim/plugged')
" Theme
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

" Version control
Plug 'airblade/vim-gitgutter'

" General coding helpers
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Productivity boosters
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'alvan/vim-closetag'
Plug 'christoomey/vim-system-copy'

" Search and discovery
Plug 'mhinz/vim-startify'
" Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Under testing
Plug 'junegunn/vim-easy-align'

" Languages
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'fatih/vim-go'
call plug#end()

" Base settings
let mapleader = "\<Space>"

syntax on

filetype plugin on

colorscheme gruvbox

set encoding=utf8
set cmdheight=2
set signcolumn=yes
set ffs=unix,dos,mac
set nocompatible
set updatetime=300
set number
set relativenumber
set path=+=**
set expandtab
set autoindent
set smarttab
set autoread
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set softtabstop=0
set showcmd
set wildmenu 
set lazyredraw
set incsearch
set hlsearch 
set ruler
set hidden
set nowrap
set laststatus=2
set scrolloff=999
set nostartofline
set nohlsearch
set clipboard+=unnamedplus

" Highlights (see: https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg)
set colorcolumn=100
highlight ColorColumn ctermbg=236

set cursorline
highlight CursorLine ctermbg=236

" Info shown in lightline
set noshowmode

ret noerrorbells
set novisualbell
set t_vb=
set tm=500

set undodir=~/.vim/undo/
set backupdir=~/.vim/backup/
set directory=~/.vim/swp/

" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ }

" Macros; qq to record, Q to replay
nnoremap Q @q

" Movement
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap ^ <nop> " Disable preset
nnoremap $ <nop> " Disable preset

nnoremap <C-J> <C-W><C-J> " Jump to buffer below
nnoremap <C-K> <C-W><C-K> " Jump to buffer above
nnoremap <C-L> <C-W><C-L> " Jump to buffer on right
nnoremap <C-H> <C-W><C-H> " Jump to buffer on left

" Complete brackets
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [
inoremap []     []

" Searches
nnoremap <silent> <leader>sc :nohlsearch<CR>
nnoremap <leader>sf :Files<CR>
nnoremap <leader>sp :GFiles<CR>
nnoremap <leader>sb :Lines<CR>

" Files
nnoremap <leader>ft :Sexplore<CR>
nnoremap <leader>rc :e ~/.vimrc<CR>
nnoremap <Leader>rr :source $MYVIMRC<CR>

" Productivity
command! W w
command! Q q

nnoremap cw ciw
nnoremap dw diw
nnoremap vw viw

command! OpenJournal :e ~/Dropbox/Journal

" Coc 
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)

nmap <silent> cdg <Plug>(coc-diagnostic-prev)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" LSP extensions
let g:coc_global_extensions = ['coc-tsserver',
                              \'coc-prettier',
                              \'coc-emmet',
                              \'coc-phpls',
                              \ ]

" Easymotion
map <Leader>l <Plug>(easymotion-bd-jk)
map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Easyalign
xmap ga <Plug>(EasyAlign)

" Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.view.php'

" Tidy (http://api.html-tidy.org/tidy/quickref_next.html)
let g:ale_html_tidy_options = '--custom-tags blocklevel --drop-empty-elements no --show-body-only true'

" Git related
nnoremap <C-p> :GitGutterPrevHunk<CR>
nnoremap <C-n> :GitGutterNextHunk<CR>

" Buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Leader>bb :Buffers<CR> 

" TypeScript / JavscScript
autocmd Filetype typescript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Prettier (using coc-prettier)
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <Leader>P :Prettier<CR> 

" PHP
autocmd BufNewFile,BufRead *.view.php setlocal ft=html

