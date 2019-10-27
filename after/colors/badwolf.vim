" -----------------------------------------------------------------------------
" File: badwolf.vim
" Author: freedzone
" Description: customization for badwolf colorscheme
" Last Modified: Oct 27, 2019
" -----------------------------------------------------------------------------

let s:signs_hi =
            \ {'err': '#df5f5f',
            \ 'warn': '#fade3e',
            \ 'info': '#0a9dff'
            \ }
let s:signs_hi_cterm =
            \ {'err': '167',
            \ 'warn': '221',
            \ 'info': '39'
            \ }
if has('gui_running')
    let s:bg = 'guibg=' . vimrc#getcolor_margin_col()
else
    let s:bg = 'ctermbg=' . vimrc#getcolor_margin_col()
endif

execute printf('highlight! SignifySignAdd %s', s:bg)
execute printf('highlight! SignifySignChange %s', s:bg)
highlight! link SignifySignDelete ErrorMsg

highlight! ALEError cterm=undercurl gui=undercurl guisp=#ff2c4b
highlight! ALEWarning cterm=undercurl gui=undercurl guisp=#f4cf86
highlight! ALEInfo cterm=undercurl gui=undercurl guisp=fg

execute printf('highlight! ALEErrorSign %s guifg=%s ctermfg=%s',
                \ s:bg, s:signs_hi['err'], s:signs_hi_cterm['err'])
execute printf('highlight! ALEWarningSign %s guifg=%s ctermfg=%s',
                \ s:bg, s:signs_hi['warn'], s:signs_hi_cterm['warn'])
execute printf('highlight! ALEInfoSign %s guifg=%s ctermfg=%s',
                \ s:bg, s:signs_hi['info'], s:signs_hi_cterm['info'])
highlight! link ALEStyleErrorSign ALEErrorSign
highlight! link ALEStyleWarningSign ALEWarningSign
