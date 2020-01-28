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
set wildmode=list:longest

" basic search
set incsearch
set showmatch
set hlsearch

" splits
set splitright
set splitbelow

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
" solarized
" fugitive
" polyglot
execute pathogen#infect()

" Goog plugins
source /usr/share/vim/google/default.vim
source /usr/share/vim/google/gtags.vim

Glug critique
Glug relatedfiles plugin[mappings]
Glug ultisnips-google
Glug youcompleteme-google
Glug syntastic-google
Glug piper plugin[mappings]
Glug codefmt plugin[mappings] gofmt_executable="goimports"
Glug codefmt-google


" YCM
set completeopt-=preview

" Mappings
noremap <unique> <Leader>cc :CritiqueComments<CR>
noremap <unique> <Leader>cn :CritiqueNextComment<CR>
noremap <unique> <Leader>cp :CritiquePreviousComment<CR>
noremap <unique> <Leader>h :set list!<CR>
noremap <unique> <Leader>p :PiperSelectActiveFiles<CR>
noremap <unique> <Leader>gi :GtImporter<CR>
noremap <unique> <Leader>gs :GtImporterSort<CR>
noremap <unique> <Leader>r :RelatedFilesWindow<CR>
noremap <C-K> :FormatLines<CR>

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
inoremap <C-K> <C-O>:FormatLines<CR>

" functions
fun! TrimWhitespace()
    let l:save=winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

"augroup autoformat_settings
"  autocmd FileType bzl AutoFormatBuffer buildifier
"  autocmd FileType go AutoFormatBuffer gofmt
"augroup END

"  theme
set background=light
colorscheme solarized
highlight Comment cterm=italic
set formatoptions+=or

filetype plugin indent on
syntax enable
