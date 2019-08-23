"" Autofolding .vimrc
" see http://vimcasts.org/episodes/writing-a-custom-fold-expression/
" vi.stackexchange.com/questions/3814/is-there-a-best-practice-to-fold-a-vimrc-file
"
" defines a foldlevel for each line of code
function! vimrc#folds(lnum)
    let s:thisline = getline(a:lnum)
    if match(s:thisline, '^"" ') >= 0
        return '>2'
    endif
    if match(s:thisline, '^""" ') >= 0
        return '>3'
    endif

    let s:two_following_lines = 0
    if line(a:lnum) + 2 <= line('$')
        let s:line_1_after = getline(a:lnum+1)
        let s:line_2_after = getline(a:lnum+2)
        let s:two_following_lines = 1
    endif
    if !s:two_following_lines
        return '='
    endif
else
    if (match(s:thisline, '^"""""') >= 0) &&
                \ (match(s:line_1_after, '^"  ') >= 0) &&
                \ (match(s:line_2_after, '^""""') >= 0)
        return '>1'
    else
        return '='
    endif
endif
endfunction

" defines a foldtext
function! vimrc#foldtext()
    " handle special case of normal comment first
    let s:info = '(' . string(v:foldend-v:foldstart) . ' l)'
    if v:foldlevel == 1
        let s:line = ' ◇ ' . getline(v:foldstart+1)[3:-2]
    elseif v:foldlevel == 2
        let s:line = '   ●  ' . getline(v:foldstart)[3:]
    elseif v:foldlevel == 3
        let s:line = '     ▪ ' . getline(v:foldstart)[4:]
    endif
    if strwidth(s:line) > 80 - len(s:info) - 3
        return s:line[:79-len(s:info)-3+len(s:line)-strwidth(s:line)] . '...' . s:info
    else
        return s:line . repeat(' ', 80 - strwidth(s:line) - len(s:info)) . s:info
    endif
endfunction

" Highlight Sign and Fold column
function! vimrc#hi_margin_col()
    let colbg = synIDattr(hlID('LineNr'), 'bg')
    " LineNr bg is not defined in a colorscheme -
    " - use default background color
    if empty(colbg)
        let bg = synIDattr(hlID('Normal'), 'bg')
        if empty(bg)
            return
        else
            let colbg = bg
        endif
    endif
    if has('gui_running')
        execute('highlight FoldColumn guifg=' . colbg . ' guibg=' . colbg)
        execute('highlight SignColumn guibg=' . colbg)
    else
        execute('highlight FoldColumn ctermbg=' . colbg . ' ctermfg=' . colbg)
        execute('highlight SignColumn ctermbg=' . colbg)
    endif
endfunction

" Toggle zoom for window
function! vimrc#zoom()
  if exists('t:is_zoomed')
    tabclose
  else
    tabnew %
    let t:is_zoomed = 1
  endif
endfunction

" PlugHelp - open readme for plugin
function! vimrc#plughelp()
    let str = matchstr(getline('.'), "'\\zs[^']\\+\\ze'")
    let str = fnamemodify(str, ':t')
    let plug_dir = g:plug_home . '/' . str

    if isdirectory(plug_dir)
        let globbed = glob(plug_dir . '/[Rr][Ee][Aa][Dd][Mm][Ee]*')

        if strlen(globbed) > 0
            let readme = split(globbed, '\n')[0]
            if filereadable(readme)
                execute 'vsplit | view ' . readme
                return 0
            endif
        endif
    endif
    return -1
endfunction
