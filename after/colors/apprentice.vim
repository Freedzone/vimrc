" -----------------------------------------------------------------------------
" File: apprentice.vim
" Author: freedzone
" Description: customization for apprentice colorscheme
" Last Modified: Oct 25, 2019
" -----------------------------------------------------------------------------

let s:signs_hi = { 'err': synIDattr(synIDtrans(hlID('SpellBad')), 'sp', 'gui'),
                \ 'warn': synIDattr(synIDtrans(hlID('SpellRare')), 'sp', 'gui'),
                \ 'info': synIDattr(synIDtrans(hlID('SpellLocal')), 'sp', 'gui')
                \ }
let s:signs_hi_cterm =
                \ {'err': synIDattr(synIDtrans(hlID('SpellBad')), 'fg', 'cterm'),
                \ 'warn': synIDattr(synIDtrans(hlID('SpellRare')), 'fg', 'cterm'),
                \ 'info': synIDattr(synIDtrans(hlID('SpellLocal')), 'fg', 'cterm')
                \ }
let s:signs_bg = {
                \ 'gui': '#1c1c1c',
                \ 'term': '234'
                \ }
let s:signs_bg_str = 'guibg=' . s:signs_bg['gui']
                \ . ' ctermbg=' . s:signs_bg['term']

execute printf('highlight! SignifySignAdd gui=bold %s guifg=%s ctermfg=%s',
                \ s:signs_bg_str,
                \ synIDattr(synIDtrans(hlID('DiffAdd')), 'fg', 'gui'),
                \ synIDattr(synIDtrans(hlID('DiffAdd')), 'fg', 'cterm'))
execute printf('highlight! SignifySignChange gui=bold %s guifg=%s ctermfg=%s',
                \ s:signs_bg_str,
                \ synIDattr(synIDtrans(hlID('DiffChange')), 'fg', 'gui'),
                \ synIDattr(synIDtrans(hlID('DiffChange')), 'fg', 'cterm'))
execute printf('highlight! SignifySignDelete gui=bold %s guifg=%s ctermfg=%s',
                \ s:signs_bg_str,
                \ synIDattr(synIDtrans(hlID('DiffDelete')), 'fg', 'gui'),
                \ synIDattr(synIDtrans(hlID('DiffDelete')), 'fg', 'cterm'))

execute printf('highlight! ALEError cterm=undercurl gui=undercurl guisp=%s',
                \ s:signs_hi['err'])
execute printf('highlight! ALEWarning cterm=undercurl gui=undercurl guisp=%s',
                \ s:signs_hi['warn'])
execute printf('highlight! ALEInfo cterm=undercurl gui=undercurl guisp=%s',
                \ s:signs_hi['info'])

execute printf('highlight! ALEErrorSign %s guifg=%s ctermfg=%s',
                \ s:signs_bg_str,
                \ s:signs_hi['err'], s:signs_hi_cterm['err'])
execute printf('highlight! ALEWarningSign %s guifg=%s ctermfg=%s',
                \ s:signs_bg_str,
                \ s:signs_hi['warn'], s:signs_hi_cterm['warn'])
execute printf('highlight! ALEInfoSign %s guifg=%s ctermfg=%s',
                \ s:signs_bg_str,
                \ s:signs_hi['info'], s:signs_hi_cterm['info'])
highlight! link ALEStyleErrorSign ALEErrorSign
highlight! link ALEStyleWarningSign ALEWarningSign

execute 'AirlineTheme tomorrow'
