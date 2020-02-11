" Put in ~/.vim/after/ftplugin/soy.vim

" 100-column limit
call matchadd('ColorColumn', '\%101v', 100)

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
