" -----------------------------------------------------------------------------
" File: srcery.vim
" Author: freedzone
" Description: customization for srcery colorscheme
" Last Modified: Oct 26, 2019
" -----------------------------------------------------------------------------

if has('gui_running')
    let s:bg = 'guibg=' . vimrc#getcolor_margin_col()
else
    let s:bg = 'ctermbg=' . vimrc#getcolor_margin_col()
endif

execute printf('highlight! SignifySignAdd gui=bold %s guifg=%s ctermfg=%s',
                \ s:bg,
                \ synIDattr(synIDtrans(hlID('DiffAdd')), 'fg', 'gui'),
                \ synIDattr(synIDtrans(hlID('DiffAdd')), 'fg', 'cterm'))
execute printf('highlight! SignifySignChange gui=bold %s guifg=%s ctermfg=%s',
                \ s:bg,
                \ synIDattr(synIDtrans(hlID('DiffChange')), 'fg', 'gui'),
                \ synIDattr(synIDtrans(hlID('DiffChange')), 'fg', 'cterm'))
execute printf('highlight! SignifySignDelete gui=bold %s guifg=%s ctermfg=%s',
                \ s:bg,
                \ synIDattr(synIDtrans(hlID('DiffDelete')), 'fg', 'gui'),
                \ synIDattr(synIDtrans(hlID('DiffDelete')), 'fg', 'cterm'))

highlight! link ALEStyleErrorSign ALEErrorSign
highlight! link ALEStyleWarningSign ALEWarningSign
