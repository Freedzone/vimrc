" -----------------------------------------------------------------------------
" File: gruvbox.vim
" Author: freedzone
" Description: customization for gruvbox colorscheme
" Last Modified: August 31, 2019
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

highlight! link ALEStyleErrorSign ALEErrorSign
highlight! link ALEStyleWarningSign ALEWarningSign

exec 'AirlineTheme bubblegum'
