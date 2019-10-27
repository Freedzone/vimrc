" -----------------------------------------------------------------------------
" File: angr.vim
" Author: freedzone
" Description: customization for angr colorscheme
" Last Modified: August 31, 2019
" -----------------------------------------------------------------------------

let s:signs_hi = { 'err': synIDattr(synIDtrans(hlID('SpellBad')), 'bg', 'gui'),
            \ 'warn': synIDattr(synIDtrans(hlID('Directory')), 'fg', 'gui'),
            \ 'info': synIDattr(synIDtrans(hlID('String')), 'fg', 'gui')
            \ }
let s:signs_hi_cterm =
            \ {'err': synIDattr(synIDtrans(hlID('SpellBad')), 'bg', 'cterm'),
            \ 'warn': synIDattr(synIDtrans(hlID('Directory')), 'fg', 'cterm'),
            \ 'info': synIDattr(synIDtrans(hlID('String')), 'fg', 'cterm')
            \ }
let s:signs_bg = {
            \ 'gui': synIDattr(synIDtrans(hlID('LineNr')), 'bg', 'gui'),
            \ 'term': synIDattr(synIDtrans(hlID('LineNr')), 'bg', 'cterm'),
            \ }
let s:bg_str = 'guibg=' . s:signs_bg['gui'] . ' ctermbg=' . s:signs_bg['term']

highlight! ALEError cterm=undercurl gui=undercurl guisp=#df005f
highlight! ALEWarning cterm=undercurl gui=undercurl guisp=#f6da7b
highlight! ALEInfo cterm=undercurl gui=undercurl guisp=fg

execute printf('highlight! ALEErrorSign %s guifg=%s ctermfg=%s',
                \ s:bg_str, s:signs_hi['err'], s:signs_hi_cterm['err'])
execute printf('highlight! ALEWarningSign %s guifg=%s ctermfg=%s',
                \ s:bg_str, s:signs_hi['warn'], s:signs_hi_cterm['warn'])
execute printf('highlight! ALEInfoSign %s guifg=%s ctermfg=%s',
                \ s:bg_str, s:signs_hi['info'], s:signs_hi_cterm['info'])
highlight! link ALEStyleErrorSign ALEErrorSign
highlight! link ALEStyleWarningSign ALEWarningSign
