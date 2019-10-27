" -----------------------------------------------------------------------------
" File: onedark.vim
" Author: freedzone
" Description: customization for onedark colorscheme
" Last Modified: August 31, 2019
" -----------------------------------------------------------------------------

highlight! SignifySignAdd gui=bold
highlight! SignifySignChange gui=bold
highlight! SignifySignDelete gui=bold

highlight! ALEError cterm=undercurl gui=undercurl guisp=#b15e7c
highlight! ALEWarning cterm=undercurl gui=undercurl guisp=#b5a262
highlight! ALEInfo cterm=undercurl gui=undercurl guisp=fg

highlight! link ALEErrorSign ErrorMsg
highlight! link ALEWarningSign WarningMsg
highlight! link ALEInfoSign Directory
