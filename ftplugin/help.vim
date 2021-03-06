" http://vim.wikia.com/wiki/Learn_to_use_help
"
" The following mappings simplify navigation when viewing help:
" Press Backspace to return from the last jump.
" Press s to find the next subject, or S to find the previous subject.
" Press o to find the next option, or O to find the previous option.
" Create file ~/.vim/ftplugin/help.vim (Unix) or $HOME/vimfiles/ftplugin/help.vim (Windows) containing:

nnoremap <buffer> <BS> <C-T>
nnoremap <buffer> o /'\l\{2,\}'<CR>
nnoremap <buffer> O ?'\l\{2,\}'<CR>
nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>

autocmd BufWinEnter <buffer> wincmd L
