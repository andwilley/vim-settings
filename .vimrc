execute pathogen#infect()
set encoding=utf-8
syntax on
set number

" whitespace
autocmd BufWritePre *.rb :%s/\s\+$//e
set listchars=trail:·
set list

" file search
set path+=**
set wildmenu
set backspace=indent,eol,start
set hlsearch

" splits
set splitright
set splitbelow

" terminal
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

" vim jsx
let g:vim_jsx_pretty_highlight_close_tag = 1

" Mappings
nnoremap ; :
noremap <Leader>w :call TrimWhitespace()<CR>
nnoremap <Leader>t :tabnew<CR>:find<Space>
nnoremap <Leader>v :vsp<CR>:find<Space>

" functions
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
