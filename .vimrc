set nocompatible
set encoding=utf-8
set history=1000
set gdefault
let mapleader=","
let maplocalleader = ','
set hidden
set ttyfast lazyredraw
set laststatus=2
set modelines=0
set noshowmode
set showcmd
set backspace=indent,eol,start
set visualbell
set scrolloff=3
set clipboard=unnamed
set autoread
set ignorecase

" line numbers and highlights
set cursorline
set ruler
set number
set relativenumber

" whitespace
set listchars=tab:▷\ ,extends:»,precedes:«,trail:•
set list

" list of files with 100 max cols (filetype must be detected, duh)
let long_files = ['soy', 'css', 'gss', 'scss', 'sql', 'java']

" file search
set path+=**
set wildmenu

" basic search
set smartcase
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
autocmd Filetype java setlocal tabstop=4
autocmd Filetype java setlocal shiftwidth=4

" NETRW setup
let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_altv=1
let g:netrw_liststyle=3

" special syntax cases
autocmd BufNewFile,BufRead *.bash* set syntax=bash
autocmd BufNewFile,BufRead *.soy set syntax=soy

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
Plugin 'dense-analysis/ale'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
" add these if not in goog env
if !filereadable(expand("~/.goog/goog.vim"))
  Plugin 'ycm-core/YouCompleteMe'
endif
call vundle#end()

" delimitmate
let g:delimitMate_jump_expansion = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let g:delimitMate_balance_matchpair = 1

" import goog stuff
if filereadable(expand("~/.goog/goog.vim"))
  source ~/.goog/goog.vim
else
  " setup non-goog stuff
  let g:ale_fixers = {
  \ 'javascript': ['prettier'],
  \ 'typescript': ['prettier'],
  \ 'typescriptreact': ['prettier'],
  \ 'haskell': ['brittany'],
  \ 'xml': ['xmllint'],
  \}
  let g:ale_fix_on_save = 0

  " ACK
  let g:ack_use_cword_for_empty_search = 1
  let g:ack_default_options = " --smart-case"

  " Maps <leader>/ so we're ready to type the search keyword.
  " This is mapped differently for goog env.
  nnoremap <Leader>/ :Ack!<Space>
  nnoremap <Leader>/f :AckFile!<Space>

  " Lombok (set $PATH_TO_LOMBOK_JAR in local bashrc)
  if len($PATH_TO_LOMBOK_JAR) > 0
    let $JAVA_TOOL_OPTIONS = "-javaagent:" . $PATH_TO_LOMBOK_JAR
    " ". " --patch-module " . "lombok=" . $PATH_TO_LOMBOK_JAR
  endif
endif

" ALE
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1

" Vimspector
let g:vimspector_install_gadgets = [ 'java-debug-adpter', 'vscode-java-debug', 'vscode-node-debug2', 'debugger-for-chrome' ]

if filereadable(expand("~/.vim/pack/vimspector/opt/vimspector/install_gadget.py"))
  packadd vimspector
  VimspectorInstall
endif

" airline
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1

" NERDtree
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" YCM
set completeopt-=preview
let g:ycm_max_diagnostics_to_display = 0

" Think [i]de [s]how ...
" ... [e]xpand
let g:ycm_key_detailed_diagnostics = '<leader>ise'
" ... [t]ype
nnoremap <leader>ist :YcmCompleter GetType<CR>
" ... [d]oc
nnoremap <leader>isd :YcmCompleter GetDoc<CR>
" ... [a]ll [d]iagnostics
nnoremap <leader>isad :YcmDiags<CR>

" THink [i]de [g]oto ...
" ... [d]efinition
nnoremap <leader>igd :YcmCompleter GoToDefinition<CR>
" ... [r]eferences
nnoremap <leader>igr :YcmCompleter GoToReferences<CR>

" Think [i]de [c]hange ...
" ... [f]ix
nnoremap <leader>icf :YcmCompleter FixIt<CR>
" ... [r]ename
nnoremap <leader>icr :YcmCompleter RefactorRename<CR>
" ... [o]rganize [i]mports
nnoremap <leader>icoi :YcmCompleter OrganizeImports<CR>

" NERD commenter
" <leader>c<space> is comment toggle
" <leader>cA switches comment symbol
" <leader>c$ comment from cursor to end of line
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" Nvim-R
let R_assign = 0

" signify
set updatetime=100

" CtrlP Setup
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
" requires adding .ctrlp files to roots locally.
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.(git|hg|svn)|node_modules)$',
  \ 'file': '\v(\~$|\/(exe|so|dll|png|jpg|gif|zip|rar|tar|gz|map))$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

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
" quick arrows
inoremap <leader>= =><space>
inoremap <leader>- -><space>
" copy the current full file path to the clipboard
nnoremap <leader>sc :let @+=TrimPath(expand('%:p'))<CR>:echom "file path copied to clipboard"<CR>
" put the current full file path on an 'edit' line
nnoremap <leader>sp :let @+=TrimPath(expand('%:p'))<CR>:e <C-R>%
" open the BUILD file in the same directory as this file
nnoremap <leader>sb :exec 'e ' . ReplaceWithBuild(TrimPath(expand('%:p')))<CR>

vnoremap <tab> %
vnoremap / /\v
vnoremap <F1> <ESC>
vnoremap * y/<c-R>"<CR>

inoremap <F1> <ESC>
inoremap jj <ESC>

" functions
fun! TrimWhitespace()
  let l:save=winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

" get rid of the part of the path we don't want (this is pretty naive)
fun! TrimPath(path)
  let halves = split(a:path, 'google3/')
  return halves[-1]
endfun

" replace the filename with BUILD
fun! ReplaceWithBuild(path)
  let bits = split(a:path, '/')
  let bits[-1] = 'BUILD'
  return join(bits, '/')
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

" extra colors
fun! MyHighlights() abort
    highlight OverLength  ctermbg=125 ctermfg=15
    " struggling to get this to work in remote tmux:
    " highlight Comment cterm=italic
endfun

" change matched col base on filetype
fun! SetMatchedCol(filetype, long_files)
  if index(a:long_files, a:filetype) >= 0
    match OverLength /\%101v/
  else
    match OverLength /\%81v/
  endif
endfun

" auto commands
augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

autocmd BufEnter * call SetMatchedCol(&filetype, long_files)

"  theme
set background=light
let g:solarized_diffmode='high'
colorscheme solarized
set formatoptions+=or

" stuff we need
filetype plugin indent on
syntax enable

