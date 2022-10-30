" Temp fix for https://github.com/vim/vim/issues/11307
syn match	vimLineComment	+^[ \t:]*".*$+	contains=@vimCommentGroup,vimCommentString,vimCommentTitle
