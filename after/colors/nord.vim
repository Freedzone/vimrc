" -----------------------------------------------------------------------------
" File: nord.vim
" Author: freedzone
" Description: customization for nord colorscheme
" Last Modified: Oct 27, 2019
" -----------------------------------------------------------------------------

highlight! SignifySignAdd gui=bold
highlight! SignifySignChange gui=bold
highlight! SignifySignDelete gui=bold

highlight! Folded guifg=#7b88a1 ctermfg=61

highlight! ALEInfo cterm=undercurl gui=undercurl guisp=fg
highlight! link ALEInfoSign Directory
highlight! link ALEStyleErrorSign ALEErrorSign
highlight! link ALEStyleWarningSign ALEWarningSign

highlight! link pythonString String
