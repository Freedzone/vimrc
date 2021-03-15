" Fix for wrong list indentation in vim-markdown when o/O
" https://github.com/plasticboy/vim-markdown/issues/126#issuecomment-640890790
au filetype markdown set formatoptions+=ro
au filetype markdown set comments=b:*,b:-,b:+,b:1.,n:>
