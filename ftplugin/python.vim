" coc
autocmd! CursorHold *.py if ! coc#float#has_float() |
            \ call CocAction('doHover') | endif
