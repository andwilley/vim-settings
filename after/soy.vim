" Put in ~/.vim/after/ftplugin/soy.vim

" 100-column limit
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

" Highlight the 100th column so we can stay in the Google guidelines
if exists('+colorcolumn')
  set colorcolumn=100
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>100v.\+', -1)
endif

" Matchit support for Soy files.
if exists("loaded_matchit")
  let b:match_ignorecase = 0
  let s:match_words = ''

  " Uncomment the following lines to debug.
  " let b:match_words = ''
  " let b:match_debug = 1

  if exists("b:match_words")
    let s:match_words = b:match_words
  endif

  let b:match_words =
        \ '{if:\({else\|{elseif\):{\/if,'
        \ . '\({template\|{deltemplate\):\({\/template\|{\/deltemplate\),'
        \ . '{element:{\/element,'
        \ . '{param:{\/param,'
        \ . '\({call\|{delcall\):\({\/call\|\/delcall\),'
        \ . '{msg:{\/msg,'
        \ . '{plural:{\/plural,'
        \ . '<\@<=\([^/][^ \t>]*\)[^>]*\%(/\@<!>\|$\):<\@<=/\1>,'
        \ . ',{:},[:],(:),'
        \ . s:match_words

endif
" vim: nowrap sw=2 sts=2 ts=8:
