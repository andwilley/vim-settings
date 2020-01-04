execute pathogen#infect()
set encoding=utf-8
syntax on
set number


" file search
set path+=**
set wildmenu
set backspace=indent,eol,start
set hlsearch

" terminal
set splitbelow
set termwinsize=15x0

" theme
filetype plugin indent on
set background=light
colorscheme solarized

" tabs
set expandtab
set tabstop=2
set shiftwidth=2
autocmd Filetype python setlocal tabstop=4
autocmd Filetype python setlocal shiftwidth=4

" NETRW setup
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3

" ALE setup
" Shorten error/warning flags
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'

" Disable or enable loclist at the bottom of vim
" Comes down to personal preferance.
let g:ale_open_list = 0
let g:ale_loclist = 0

" Setup compilers for languages
let g:ale_linters = {
      \  'cs':['syntax', 'semantic', 'issues'],
      \  'python': ['pylint'],
      \ }

" Mappings
nnoremap ; :
