set nocompatible
set encoding=utf-8
set history=1000
set number
set relativenumber
set ignorecase
set smartcase
set gdefault
let mapleader=","
let maplocalleader = ','
set hidden
set ttyfast lazyredraw
set ruler
set laststatus=2
set modelines=0
set noshowmode
set showcmd
set backspace=indent,eol,start
set visualbell
set scrolloff=3
set clipboard=unnamed
set autoread
set cursorline

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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ludovicchabant/vim-lawrencium'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
" Plugin 'scrooloose/syntastic'
Plugin 'schickling/vim-bufonly'
Plugin 'tpope/vim-repeat'
Plugin 'mhinz/vim-signify'
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'sheerun/vim-polyglot'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'tpope/vim-unimpaired'
Plugin 'jalvesaq/Nvim-R'
" Plugin 'easymotion/vim-easymotion'
" add these if not in goog env
if filereadable(expand("~/goog.vim"))
  Plugin 'prabirshrestha/async.vim'
  Plugin 'prabirshrestha/vim-lsp'
  Plugin 'prabirshrestha/asyncomplete.vim'
  Plugin 'prabirshrestha/asyncomplete-lsp.vim'
else
  Plugin 'ycm-core/YouCompleteMe'
  Plugin 'dense-analysis/ale'
  Plugin 'ludovicchabant/vim-gutentags'
endif
call vundle#end()

" delimitmate
let g:delimitMate_jump_expansion = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let g:delimitMate_balance_matchpair = 1

" import goog stuff
if filereadable(expand("~/goog.vim"))
  source ~/goog.vim
else
  let g:ale_lint_on_text_changed = 0
  let g:ale_lint_on_insert_leave = 1
  let g:ale_lint_on_enter = 0
  let g:ale_lint_on_save = 0
endif

" syntastic
" let g:syntastic_enable_signs = 1
" let g:syntastic_error_symbol = "✗"
" let g:syntastic_warning_symbol = "⚠"
" let g:syntastic_enable_balloons = 1
" let g:syntastic_enable_highlighting = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_aggregate_errors = 1
" let g:syntastic_javascript_checkers = [ 'glint' ]

" airline
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1

" NERDtree
:nnoremap <leader>n :NERDTreeToggle<CR>

" YCM
set completeopt-=preview
if !exists("g:ycm_semantic_triggers")
   let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers = {
  \ 'typescript': ['.'],
  \ 'javascript': ['.']
  \}

" Nvim-R
let R_assign = 0

nnoremap <leader>id :YcmCompleter GoToDefinition<CR>

" polyglot
let g:polyglot_disabled = ['jsx']

" signify
set updatetime=100

" Session
let g:session_autosave = 'no'
let g:session_autoload = 'no'
let g:session_directory = '~/.vim/local/sessions'

nnoremap <leader>l :call LoadSession()<CR>

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
nnoremap <leader>sc :let @+=TrimCitcPath(expand('%:p'))<CR>:echom "file path copied to clipboard"<CR>

vnoremap <tab> %
vnoremap / /\v
vnoremap <F1> <ESC>

inoremap <F1> <ESC>
inoremap jj <ESC>

" functions
fun! TrimWhitespace()
  let l:save=winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

" get rid of the citc path if it exists (this is pretty naive)
fun! TrimCitcPath(path)
  let halves = split(a:path, 'google3')
  return halves[-1]
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

