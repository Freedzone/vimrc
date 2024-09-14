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

"" Markdown
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH2
hi! link htmlH3 markdownH3
hi! link htmlH4 markdownH4
hi! link htmlH5 markdownH5
hi! link htmlH6 markdownH6
hi! link mkdDelimiter markdownHeadingDelimiter
"
hi! link mkdCode markdownCode
" hi! link markdownCodeBlock CodeBlock
hi! link mkdCodeDelimiter markdownCodeDelimiter
"
" hi! link markdownBlockquote Quote
hi! link mkdListItem markdownListMarker
hi! link mkdNonListItem markdownOrderedListMarker
" hi! link markdownRule Punctuation
" hi! link markdownHeadingRule Punctuation
"
" hi! link markdownUrlDelimiter Punctuation
" hi! link markdownLinkDelimiter Punctuation
" hi! link markdownLinkTextDelimiter Punctuation
"
hi! link mkdURL markdownUrl
hi! link mkdDelimiter markdownUrlTitleDelimiter
"
" hi! link markdownLinkText Identifier
" hi! link markdownIdDeclaration Identifier

exec 'AirlineTheme bubblegum'
