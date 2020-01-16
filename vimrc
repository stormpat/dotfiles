" @stormpat's Vim config

call plug#begin('~/.vim/plugged')
" Themes and visual
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Version control
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'
let g:blamer_prefix = ':: '
let g:blamer_template = '<author> <author-time> <summary>'
let g:blamer_date_format = '%d.%m.%Y %H:%M'

" Language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Productivity boosters
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'

" Searching, files and discovery
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Netrw replacement
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'| " A rager dependency
let g:ranger_replace_netrw = 1

" Misc
Plug 'psf/black'| " Requires pip install neovim

"Languages
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'fatih/vim-go'
Plug 'reasonml-editor/vim-reason-plus'
call plug#end()

" Follow the leader
let mapleader = "\<Space>"
let maplocalleader = ","

colorscheme gruvbox
let g:airline_theme='base16_gruvbox_dark_hard'

" Mostly sensible defaults
syntax on
filetype plugin on

set termguicolors
set splitbelow
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set nrformats-=octal
set ruler
set wildmenu
set history=1000
set autoread
set encoding=utf8
set signcolumn=yes
set ffs=unix,dos,mac
set nocompatible
set updatetime=300
set number
set relativenumber
set path=+=**
set expandtab
set autoread
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set softtabstop=0
set showcmd
set lazyredraw
set incsearch
set hidden
set nowrap
set scrolloff=999
set nostartofline
set nohlsearch
set clipboard+=unnamedplus
set diffopt+=vertical

" Highlights (https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg)
set colorcolumn=100
highlight ColorColumn ctermbg=236

set cursorline
highlight CursorLine ctermbg=236

hi ExtraWhitespace ctermbg=black guibg=black
match ExtraWhitespace /\s\+$/

set laststatus=2
set noshowmode
set cmdheight=1

set noerrorbells
set novisualbell
set t_vb=
set tm=500

" set undodir=~/.vim/undo/
" set backupdir=~/.vim/backup/
" set directory=~/.vim/swp/
set nobackup
set noswapfile
set noundofile

" Macros; qq to record, Q to replay
nnoremap Q @q

" Movement
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap ^ <nop>
nnoremap $ <nop>

nnoremap <leader>q :q<CR>

" Jump to split buffers
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Searches
nnoremap <silent> <leader>sc :nohlsearch<CR>
nnoremap <leader>sf :Files<CR>
nnoremap <leader>sp :GFiles<CR>
nnoremap <leader>sP :GFiles?<CR>
nnoremap <leader>sb :Lines<CR>
nnoremap ? :BLines<CR>

nnoremap <leader>ft :RangerCurrentDirectory<CR>
nnoremap <leader>rc :e ~/.vimrc<CR>
nnoremap <Leader>rr :source $MYVIMRC<CR>
nnoremap <LocalLeader>e :edit <C-R>=expand('%:p:h') . '/'<CR>

" Windows
nnoremap <Leader>o :only<CR>

" Productivity
command! W w
command! Q q

nnoremap cw ciw
nnoremap dw diw
nnoremap vw viw
nnoremap yw yiw

command! OpenJournal :edit ~/Dropbox/Journal
command! Bclose :bufdo bd

nnoremap <Leader>o :only<CR>
nnoremap <LocalLeader>p viw"0p

" Coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)
nmap <silent> qf <Plug>(coc-fix-current)
nmap <silent> ge <Plug>(coc-diagnostic-prev)
nmap <silent> gE <Plug>(coc-diagnostic-next)

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
                              \'coc-reason',
                              \'coc-prettier',
                              \'coc-snippets',
                              \'coc-python',
                              \'coc-emmet',
                              \'coc-phpls',
                              \ ]
" Closetag
let g:closetag_filenames = '*.html, *.view.php, *.jsx, *.tsx'
let g:closetag_regions = {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ }

" Tidy (http://api.html-tidy.org/tidy/quickref_next.html)
" let g:ale_html_tidy_options = '--custom-tags blocklevel --drop-empty-elements no --show-body-only true'

function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

command! -nargs=0 TrimWhiteSpace call TrimWhiteSpace()

command! -nargs=0 Workon call fzf#run(
            \ {
            \ 'source': 'cat ~/.myprojects',
            \ 'sink': 'cd',
            \ 'options': '+m',
            \ 'down': '20%'
            \ })

nnoremap <C-p> :GitGutterPrevHunk<CR>
nnoremap <C-o> :GitGutterNextHunk<CR>

" Buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Leader>bb :Buffers<CR>

" TypeScript / JavscScript
autocmd Filetype typescript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Prettier (using coc-prettier)
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" PHP
autocmd BufNewFile,BufRead *.view.php setlocal ft=html

" Abbreviations
iab date: <c-r>=strftime("%d.%m.%Y")

" FZF
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'down': '~20%' }

