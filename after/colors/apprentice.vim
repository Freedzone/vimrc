" -----------------------------------------------------------------------------
" File: apprentice.vim
" Author: freedzone
" Description: customization for apprentice colorscheme
" Last Modified: August 2, 2019
" -----------------------------------------------------------------------------

exec 'highlight SignifySignAdd gui=bold guibg=#1c1c1c ctermbg=234' .
        \' guifg=' . synIDattr(synIDtrans(hlID('DiffAdd')), 'fg', 'gui') .
        \' ctermfg=' . synIDattr(synIDtrans(hlID('DiffAdd')), 'fg', 'cterm')
exec 'highlight SignifySignChange gui=bold guibg=#1c1c1c ctermbg=234' .
        \' guifg=' . synIDattr(synIDtrans(hlID('DiffChange')), 'fg', 'gui') .
        \' ctermfg=' . synIDattr(synIDtrans(hlID('DiffChange')), 'fg', 'cterm')
exec 'highlight SignifySignDelete gui=bold guibg=#1c1c1c ctermbg=234' .
        \' guifg=' . synIDattr(synIDtrans(hlID('DiffDelete')), 'fg', 'gui') .
        \' ctermfg=' . synIDattr(synIDtrans(hlID('DiffDelete')), 'fg', 'cterm')

exec 'AirlineTheme tomorrow'
