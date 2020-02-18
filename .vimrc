set nocompatible
set encoding=utf-8
set history=1000
set relativenumber
set ignorecase
set smartcase
set gdefault
let mapleader=","
set hidden
set ttyfast lazyredraw
set ruler
set laststatus=2
set modelines=0
set showmode
set showcmd
set backspace=indent,eol,start
set visualbell
set scrolloff=3
set clipboard=unnamed

" column limit
call matchadd('ColorColumn', '\%81v', 100)

" whitespace
set listchars=tab:▷\ ,extends:»,precedes:«,trail:•
set list

" file search
set path+=**
set wildmenu

" basic search
set incsearch
set showmatch
set hlsearch

" splits
set splitright
set splitbelow

" terminal
set termwinsize="15x0"

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

" drew's plugins
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'xolox/vim-misc'
Plugin 'sheerun/vim-polyglot'
Plugin 'xolox/vim-session'
" add these if not in goog env
if filereadable(expand("~/goog.vim"))
  Plugin 'prabirshrestha/async.vim'
  Plugin 'prabirshrestha/vim-lsp'
  Plugin 'prabirshrestha/asyncomplete.vim'
  Plugin 'prabirshrestha/asyncomplete-lsp.vim'
else
  Plugin 'ycm-core/YouCompleteMe'
  Plugin 'dense-analysis/ale'
endif
call vundle#end()

" import goog stuff
if filereadable(expand("~/goog.vim"))
  source ~/goog.vim
endif

" YCM
set completeopt-=preview

" Session
let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:session_directory = '~/.vim/local/sessions'

" Regular Mappings
nnoremap ; :
nnoremap <Leader>w :call TrimWhitespace()<CR>
nnoremap <Leader>t :tabnew<CR>:e<Space>
nnoremap <Leader>\| :vsp<CR>:e<Space>
nnoremap <Leader>- :sp<CR>:e<Space>
nnoremap <Leader><Space> :noh<CR>
nnoremap / /\v
nnoremap <F1> <ESC>
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
nnoremap <leader>c :term<CR><C-w>:resize<space>15<CR>
nnoremap <leader>l :call LoadSession()<CR>

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


" careful, WIP
fun! LoadSession()
  if filereadable("Session.vim")
    source Session.vim
  else
    call inputsave()
    let name = call input('Enter session name: ')
    SaveSession name
    call inputrestore()
  endif
endfun

"  theme
set background=light
colorscheme solarized
highlight Comment cterm=italic
set formatoptions+=or

" stuff we need
filetype plugin indent on
syntax enable

