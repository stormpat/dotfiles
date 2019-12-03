" @stormpat's Vim config

call plug#begin('~/.vim/plugged')
" Theme and visuals
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

" Version control
Plug 'airblade/vim-gitgutter'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Productivity boosters
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'alvan/vim-closetag'

" Search and discovery
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" Languages
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'fatih/vim-go'
Plug 'reasonml-editor/vim-reason-plus'
call plug#end()

" Base settings
let mapleader = "\<Space>"

syntax on

filetype plugin on

colorscheme gruvbox

" Mostly sensible defaults
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set nrformats-=octal
set laststatus=2
set ruler
set wildmenu
set history=1000
set autoread

 set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

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
set autoread
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set softtabstop=0
set showcmd
set lazyredraw
set incsearch
set hlsearch
set hidden
set nowrap
set scrolloff=999
set nostartofline
set nohlsearch
set clipboard+=unnamedplus

" Highlights (see: https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg)
set colorcolumn=100
highlight ColorColumn ctermbg=236

set cursorline
highlight CursorLine ctermbg=236

hi default CocUnderline    cterm=underline gui=underline
hi default CocErrorSign    ctermfg=Red     guifg=#ff0000
hi default CocWarningSign  ctermfg=Brown   guifg=#ff922b
hi default CocInfoSign     ctermfg=Yellow  guifg=#fab005
hi default CocHintSign     ctermfg=Blue    guifg=#15aabf
hi default CocSelectedText ctermfg=Red     guifg=#fb4934
hi default CocCodeLens     ctermfg=Gray    guifg=#999999
hi default link CocErrorFloat       CocErrorSign
hi default link CocWarningFloat     CocWarningSign
hi default link CocInfoFloat        CocInfoSign
hi default link CocHintFloat        CocHintSign
hi default link CocErrorHighlight   CocUnderline
hi default link CocWarningHighlight CocUnderline
hi default link CocInfoHighlight    CocUnderline
hi default link CocHintHighlight    CocUnderline
hi default link CocListMode         ModeMsg
hi default link CocListPath         Comment
hi default link CocFloating         Pmenu
hi default link CocHighlightText    CursorColumn
hi default link CocHighlightRead    CocHighlightText
hi default link CocHighlightWrite   CocHighlightText

hi ExtraWhitespace ctermbg=black guibg=red
match ExtraWhitespace /\s\+$/

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
      \   'left': [ [ 'mode', 'paste'],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'sep': ' ',
      \  },
      \ 'component_function': {
      \   'lsp': 'coc#status'
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
nnoremap <leader>ft :Ranger<CR>
nnoremap <leader>fr :RangerWorkingDirectory<CR>
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
                              \'coc-reason',
                              \'coc-prettier',
                              \'coc-emmet',
                              \'coc-phpls',
                              \ ]
" Closetag
let g:closetag_filenames = '*.html, *.view.php, *.jsx, *.tsx'
let g:closetag_regions =  {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ }

" Tidy (http://api.html-tidy.org/tidy/quickref_next.html)
let g:ale_html_tidy_options = '--custom-tags blocklevel --drop-empty-elements no --show-body-only true'

function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

command! -nargs=0 TrimWhiteSpace call TrimWhiteSpace()

" Testing out custom fzf wrappers.
" Could build a'workon' like project manager
function FooBar()
    for name in ['bar', 'foo', 'baz']
        echo name
    endfor
endfunction

command! TestFZF call fzf#run({
            \  'source':  'cat ~/Desktop/foo.tzt',
            \  'sink':    'e',
            \  'options': '-m -x +s',
            \  'down':    '40%'})

command! -nargs=0 ShowFoo call FooBar()

" Ranger
let g:ranger_replace_netrw = 1

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

" Abbreviations
iab :date: <c-r>=strftime("%d.%m.%Y")
