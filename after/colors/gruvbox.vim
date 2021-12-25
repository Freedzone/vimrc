" -----------------------------------------------------------------------------
" File: gruvbox.vim
" Author: freedzone
" Description: customization for gruvbox colorscheme
" -----------------------------------------------------------------------------

if has('gui_running')
    let s:bg = 'guibg=' . vimrc#getcolor_margin_col()
else
    let s:bg = 'ctermbg=' . vimrc#getcolor_margin_col()
endif

highlight SignifySignAdd gui=bold guifg=#00af00 cterm=bold ctermfg=34
highlight SignifySignChange gui=bold guifg=#ffaf5f cterm=bold ctermfg=215
highlight SignifySignDelete gui=bold guifg=#d75f5f cterm=bold ctermfg=167

execute 'highlight GruvboxRedSign ' . s:bg
execute 'highlight GruvboxGreenSign ' . s:bg
execute 'highlight GruvboxYellowSign ' . s:bg
execute 'highlight GruvboxBlueSign ' . s:bg
execute 'highlight GruvboxPurpleSign ' . s:bg
execute 'highlight GruvboxAquaSign ' . s:bg

highlight! link Operator Number

highlight! link ALEStyleErrorSign ALEErrorSign
highlight! link ALEStyleWarningSign ALEWarningSign

" coc
highlight! link CocHighlightText StatusLine
highlight! link CocHoverRange CocHighlightText

" Language specific
"" PHP
highlight! link phpFunction Function
highlight! link phpMethod phpInclude
highlight! link phpDocComment SpecialKey
highlight! link phpDocIdentifier Constant
highlight! link phpDocTags GruvBoxFG3

exec 'AirlineTheme bubblegum'
