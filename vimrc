" @stormpat's Vim config.

call plug#begin('~/.vim/plugged')
" Theme
Plug 'rakr/vim-one'

" General coding helpers
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Productivity boosters
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'

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


"function! Tab_Or_Complete()
"  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"    return "\<C-N>"
"  else
"    return "\<Tab>"
"  endif
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
"
let mapleader = "\<Space>"

syntax on
filetype plugin on

set nocompatible
set number
set relativenumber
set path=+=**
set expandtab
set autoindent
set smarttab
"set backspace=indent,eol,start
"set complete-=i
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
"set nowrap
"set formatoptions-=t
set laststatus=2
set scrolloff=10
set nostartofline

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

if has('gui_running')
  " Turn off them scrollbars
  set guioptions-=L
  set guioptions-=R
  set guioptions-=b
  set guioptions-=l
  set guioptions-=r
  
  augroup RCVisual
      autocmd!
      autocmd GUIEnter * colorscheme one
  augroup END

  let g:one_allow_italics = 1
  set guifont=Hack:h12
  set background=dark
  " set termguicolors
  " set t_Co=256
endif


"" Autocommands
" *** dust ***

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
:nnoremap <Leader>rr :source $MYVIMRC<CR>

"" Productivity
:command W w
:command Q q

:command OpenJournal :e ~/Dropbox/Journal
":inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>| " Autocomplete with tab

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
        

"" Buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>
:nnoremap <Leader>bb :Buffers<CR> 

"" Autocomplete
"set completeopt=longest,menuone


"" TypeScript
"
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

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


