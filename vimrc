" @stormpat's Vim config

call plug#begin('~/.vim/plugged')
Plug 'ashfinal/vim-colors-paper'
Plug 'habamax/vim-polar'

Plug 'airblade/vim-gitgutter'
Plug 'romgrk/searchReplace.vim'
Plug 'APZelos/blamer.nvim'
Plug 'rhysd/git-messenger.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'terryma/vim-expand-region'
Plug 'easymotion/vim-easymotion'

Plug 'voldikss/vim-floaterm'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

Plug 'vifm/vifm.vim'

Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'fatih/vim-go'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'cespare/vim-toml'
call plug#end()

" Follow the leader
let mapleader = "\<Space>"
let maplocalleader = ","

" Mostly sensible defaults
syntax on
filetype plugin on

" Go to last knows cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Spell checking
set spell spelllang=en_us
set nospell

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

" set number
" set relativenumber

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
set hlsearch
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

set nobackup
set nowritebackup
set noswapfile
set noundofile

syntax on
colorscheme paper
set background=light

let g:blamer_prefix = ':: '
let g:blamer_template = '<author> <author-time> <summary>'
let g:blamer_date_format = '%d.%m.%Y %H:%M'
let g:blamer_enabled = 0

" Macros; qq to record, Q to replay
nnoremap Q @q

" Movement
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap ^ <nop>
nnoremap $ <nop>

" Jump to split buffers
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Replace from register zero (allows multiple same changes
map <C-j> cw<C-r>0<ESC>

" Searches
nnoremap <leader>sf :Files<CR>
nnoremap <leader>sp :GFiles<CR>
nnoremap <leader>sP :GFiles?<CR>
nnoremap <leader><CR> :FZFMru<CR>
nnoremap <leader>sl :Lines<CR>
nnoremap <Leader>sb :Buffers<CR>
nnoremap ? :BLines<CR>

" Git stuff
nnoremap <silent><Leader>bs :BlamerToggle<CR>

let g:git_messenger_include_diff = 'none'
let g:git_messenger_close_on_cursor_moved=1
let g:git_messenger_max_popup_width=0.8
let g:git_messenger_always_into_popup=1
let g:git_messenger_date_format = "%d.%m.%Y %X"

" Easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
let g:EasyMotion_do_mapping=0
nmap <LocalLeader>g <Plug>(easymotion-s)

" Better indenting
vnoremap < <gv
vnoremap > >gv

nnoremap <silent><Leader>ft :Vifm<CR>

nnoremap <leader>rc :e ~/.vimrc<CR>
nnoremap <LocalLeader>e :edit <C-R>=expand('%:p:h') . '/'<CR>

" Productivity
command! W w
command! Q q

nnoremap cw ciw
nnoremap dw diw
nnoremap vw viw
nnoremap yw yiw

command! OpenJournal :Vifm ~/Dropbox/Journal
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
vmap <leader> fs <Plug>(coc-format-selected)

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
                              \'coc-python',
                              \'coc-emmet',
                              \'coc-phpls',
                              \ ]

" Python
" g:python3_host_prog = "/usr/local/bin/python3"
autocmd FileType python map <Leader>x :! python %<CR>

" Closetag
let g:closetag_filenames = '*.html, *.view.php, *.jsx, *.tsx'
let g:closetag_regions = {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ }

function! TrimWhiteSpace()
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

nnoremap <silent><C-n> :GitGutterPrevHunk<CR>
nnoremap <silent><C-m> :GitGutterNextHunk<CR>

" Expansions
map <Leader>K <Plug>(expand_region_expand)
map <Leader>J <Plug>(expand_region_shrink)

" TypeScript / JavscScript
autocmd Filetype typescript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Ocaml
autocmd FileType ocaml map <leader>x :! ocaml %<CR>

" Disable autocomment  on new line
autocmd BufNewFile,BufWinEnter * setlocal formatoptions-=cro

" Prettier (using coc-prettier)
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" PHP templates
autocmd BufNewFile,BufRead *.view.php setlocal ft=html

" Abbreviations
iab date: <c-r>=strftime("%d.%m.%Y")
imap cll console.log()<Esc>i

" Floatterm
let g:floaterm_autoclose=1
let g:floaterm_width=0.95
nnoremap <Leader>tt :FloatermNew lazygit<CR>

" FZF
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }
" https://github.com/kyazdani42/dotfiles/blob/master/config/nvim/init.vim
autocmd! FileType fzf set laststatus=0 noshowmode noruler nonumber norelativenumber
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler relativenumber


