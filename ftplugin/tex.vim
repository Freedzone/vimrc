function! s:coc_settings() abort
    " mappings
    noremap <silent> <F5> :CocCommand latex.Build<CR>
endfunction

" COMMON
" * eliminate annoying autoindent
set autoindent!
set smartindent
let g:tex_indent_items=0
let g:tex_indent_and=0
let g:tex_indent_brace=0
" completion for labels
set iskeyword+=:

" coc-texlab
" completion for labels
let b:coc_additional_keywords = [":"]
if exists('g:coc_global_extensions')
            \ && index(g:coc_global_extensions, "coc-texlab") > 0
    call s:coc_settings()
endif
