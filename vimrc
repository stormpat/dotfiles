" @stormpat's Vim config

call plug#begin('~/.vim/plugged')
" Theme
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'itchyny/lightline.vim'

" Version control
Plug 'airblade/vim-gitgutter'

" General coding helpers
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Productivity boosters
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'

" Search and discovery
Plug 'mhinz/vim-startify'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Languages
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
call plug#end()

" Functions
" 
" function! s:find_git_root()
"   return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
" endfunction

"function! s:grep_project_file(...)
"  execute 'cd' s:find_git_root() | :Rg a:0
"endfunction



"function! <SID>AutoProjectRootCD()
"  try
"    if &ft != 'help'
"      ProjectRootCD
"    endif
"  catch
"    " Silently ignore invalid buffers
"  endtry
"endfunction
"

"" Base settings
let mapleader = "\<Space>"

syntax on
filetype plugin on

colorscheme gruvbox

set encoding=utf8
set ffs=unix,dos,mac
set nocompatible
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
set cursorline
set wildmenu 
set lazyredraw
set incsearch
set hlsearch 
set ruler
set hidden
set nowrap
set laststatus=2
set scrolloff=10
set nostartofline

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set undodir=~/.vim/undo/
set backupdir=~/.vim/backup/
set directory=~/.vim/swp/

" Statusline
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

" Make one off macros faster
nnoremap Q @q " qq to record, Q to replay

" if has('gui_vimr')
  " Turn off them scrollbars
  " set guioptions-=L
  " set guioptions-=R
  " set guioptions-=b
  " set guioptions-=l
  " set guioptions-=r
  
  " augroup RCVisual
  "     autocmd!
  "     autocmd GUIEnter * colorscheme gruvbox
  " augroup END

  " set guifont=Roboto\ Mono:h12
  " set guifont=Hack:h12
  " set guifont=SF\ Mono:h12
  " set guifont=IBM\ Plex\ Mono:h12
" elseif &t_Co == 256
"     set termguicolors
" "     colorscheme codedark
" endif



"" Movement
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

"" Searches
:nnoremap <silent> <leader>sc :nohlsearch<CR>
:nnoremap <leader>sf :Files<CR>
:nnoremap <leader>sp :GFiles<CR>
:nnoremap <leader>sb :Lines<CR>


" command! GrepProjectFiles execute 'cd' s:find_git_root() | :Rg
" command! -nargs=1 ProjectGrep call s:grep_project_file(<f-args>)

"" Files
:nnoremap <leader>rc :e ~/.vimrc<CR>
:nnoremap <Leader>rr :source ~/dotfiles/vimrc<CR>

"" Productivity
:command! W w
:command! Q q

:nnoremap cw ciw
:nnoremap dw diw
:nnoremap vw viw

:command! OpenJournal :e ~/Dropbox/Journal

" function! Tab_OrComplete()
"   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"     return "\<C-N>"
"   else
"     return "\<Tab>"
"   endif
" endfunction

" :inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" :inoremap <C-j> <Down>   
" :inoremap <C-k> <Up>
" :inoremap <C-h> <Left>
" :inoremap <C-l> <Right>

" Up and down in autocomplete boxes
" Annoying as HELL. CAnnot search for 'k' and 'j'
" inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
" inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

"" Coc 
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

"" Easymotion
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


"" Gitgutter
nmap gk <Plug>(GitGutterNextHunk)
nmap gj <Plug>(GitGutterPrevHunk)


"" Buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
:nnoremap <Leader>bb :Buffers<CR> 

"" TypeScript / JavscScript
"
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
autocmd Filetype typescript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

"" PHP
"
autocmd BufNewFile,BufRead *.php setlocal formatprg="prettier\ --parser="php"
autocmd FileType php let b:prettier_ft_default_args = {'parser': 'php'} 
autocmd BufNewFile,BufRead *.view.php setlocal ft=html
autocmd BufNewFile,BufRead *.view.php setlocal formatprg=prettier\ --parser="html"

"" HACK
"" nnoremap gp :silent %!prettier --stdin --stdin-filepath % --trailing-comma all --single-quote<CR>
"" let g:prettier#autoformat = 0
"" let g:prettier#exec_cmd_async = 1

"" nnoremap <leader>p %! ~/dev/innovoice/node_modules/.bin/prettier --parser="html"<CR>

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_html_tidy_ignore_errors=["trimming empty <span>", "trimming empty <i>", "trimming empty <button>", "trimming empty <select>"]


"" Fzf
"" Set Ack to ag
"let g:ackprg = "ag"
"let g:ack_default_options = " --case-sensitive --noheading --nopager --nocolor --nogroup --column" 

"command! -nargs=1 Ag execute "Ack! <args> " . s:find_git_root()


