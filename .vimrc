execute pathogen#infect()
set encoding=utf-8
syntax on
set relativenumber
set ignorecase
set smartcase
set gdefault
let mapleader=","
set hidden
set ttyfast
set ruler
set laststatus=2
set nocompatible
set modelines=0
set showmode
set showcmd
au FocusLost * :wa

" column limit
call matchadd('ColorColumn', '\%81v', 100)

" whitespace
set listchars=trail:·
set list

" file search
set path+=**
set wildmenu
set backspace=indent,eol,start
set incsearch
set showmatch
set hlsearch

" tags
let g:gutentags_ctags_exclude=["node_modules", "dist"]

" splits
set splitright
set splitbelow

" theme
filetype plugin indent on
set background=light
colorscheme solarized
highlight Comment cterm=italic
set formatoptions+=or

" tabs
set expandtab
set tabstop=2
set shiftwidth=2
autocmd Filetype python setlocal tabstop=4
autocmd Filetype python setlocal shiftwidth=4

" NETRW setup
let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_altv=1
let g:netrw_liststyle=3

" AutoPairs
let g:AutoPairsCenterLine=0

" YCM
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0

" ALE setup
" Shorten error/warning flags
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'

" Disable or enable loclist at the bottom of vim
" Comes down to personal preferance.
let g:ale_open_list=0
let g:ale_set_loclist=0

" Setup compilers for languages
let g:ale_linters={
      \  'python': ['pylint', 'mypy'],
      \  'haskell': ['hlint'],
      \ }

" Mappings
nnoremap ; :
noremap <Leader>w :call TrimWhitespace()<CR>
nnoremap <Leader>t :tabnew<CR>:find<Space>
nnoremap <Leader>v :vsp<CR>:find<Space>
nnoremap <Leader><Space> :noh<CR>
nnoremap / /\v
nnoremap <F1> <ESC>
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %

vnoremap <tab> %
vnoremap / /\v
vnoremap <F1> <ESC>

inoremap <F1> <ESC>
inoremap jj <ESC>
inoremap (; (<CR>);<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap (- (<CR>)<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap {- {<CR>}<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O
inoremap [- [<CR>]<C-c>O

" functions
fun! TrimWhitespace()
    let l:save=winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
