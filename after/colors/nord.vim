" -----------------------------------------------------------------------------
" File: nord.vim
" Author: freedzone
" Description: customization for nord colorscheme
" -----------------------------------------------------------------------------

highlight! SignifySignAdd gui=bold
highlight! SignifySignChange gui=bold
highlight! SignifySignDelete gui=bold

highlight! Folded guifg=#7b88a1 ctermfg=61

highlight! ALEInfo cterm=undercurl gui=undercurl guisp=fg
highlight! link ALEInfoSign Directory
highlight! link ALEStyleErrorSign ALEErrorSign
highlight! link ALEStyleWarningSign ALEWarningSign

highlight! link EasyMotionTarget SpecialChar
highlight! link EasyMotionTarget2First EasyMotionTarget2FirstDefault
highlight! link EasyMotionTarget2Second EasyMotionTarget2SecondDefault

" coc
highlight! link CocHighlightText StatusLine
highlight! link CocHoverRange CocHighlightText

" Language specific

highlight! link pythonBuiltinFunc SpecialChar
highlight! link pythonConditional pythonStatement
highlight! link pythonFunction Function
highlight! link pythonImport Keyword
highlight! link pythonRepeat pythonStatement
highlight! link pythonOperator Operator
highlight! link pythonStatement Statement
highlight! link pythonStrFormat SpecialChar
highlight! link pythonString String
