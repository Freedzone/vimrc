" -----------------------------------------------------------------------------
" File: plastic.vim
" Author: freedzone
" Description: customization for plastic colorscheme
" Last Modified: Oct 26, 2019
" -----------------------------------------------------------------------------
let s:signs_hi = { 'err': synIDattr(synIDtrans(hlID('SpellBad')), 'sp', 'gui'),
                \ 'warn': synIDattr(synIDtrans(hlID('WarningMsg')), 'fg', 'gui'),
                \ }
let s:signs_hi_cterm =
                \ {'err': synIDattr(synIDtrans(hlID('SpellBad')), 'fg', 'cterm'),
                \ 'warn': synIDattr(synIDtrans(hlID('WarningMsg')), 'fg', 'cterm'),
                \ }

execute printf('highlight! SignifySignAdd gui=bold guifg=%s ctermfg=%s',
                \ synIDattr(synIDtrans(hlID('DiffAdd')), 'bg', 'gui'),
                \ synIDattr(synIDtrans(hlID('DiffAdd')), 'bg', 'cterm'))
execute printf('highlight! SignifySignChange gui=bold guifg=%s ctermfg=%s',
                \ synIDattr(synIDtrans(hlID('DiffChange')), 'bg', 'gui'),
                \ synIDattr(synIDtrans(hlID('DiffChange')), 'bg', 'cterm'))
execute printf('highlight! SignifySignDelete gui=bold guifg=%s ctermfg=%s',
                \ synIDattr(synIDtrans(hlID('DiffDelete')), 'bg', 'gui'),
                \ synIDattr(synIDtrans(hlID('DiffDelete')), 'bg', 'cterm'))

execute printf('highlight! ALEError cterm=undercurl gui=undercurl guisp=%s',
                \ s:signs_hi['err'])
execute printf('highlight! ALEWarning cterm=undercurl gui=undercurl guisp=%s',
                \ s:signs_hi['warn'])

highlight! ALEInfo cterm=undercurl gui=undercurl guisp=fg
highlight! link ALEErrorSign ErrorMsg
execute printf('highlight! ALEWarningSign guifg=%s ctermfg=%s',
                \ s:signs_hi['warn'], s:signs_hi_cterm['warn'])
highlight! link ALEInfoSign Conceal
highlight! link ALEStyleErrorSign ALEErrorSign
highlight! link ALEStyleWarningSign ALEWarningSign

exec 'AirlineTheme tomorrow'
