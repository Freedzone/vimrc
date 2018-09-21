source <sfile>:p:h/c_cpp_h_hpp.vim

nnoremap <silent> <S-F7> :w<CR> :!gcc -o %:r %<CR>
