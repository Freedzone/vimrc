"""""""""""""
"  Defines  "
"""""""""""""
let $VIMHOME = '$HOME/.vim'
let $VIMCUSTOM = '$VIMHOME/local' " host specific configs
let s:is_win = has("win64") || has("win32") || has("win16")

if s:is_win
    set runtimepath+=$HOME/.vim
endif

"" Functions
" source file if exists
function! s:lsource(filename)
    let expfilename = expand(a:filename)
    if filereadable(glob(expfilename))
        exec "source " . expfilename
    endif
endfunction

"""""""""""""""""""""""""
"  Plugins (vim-plug)  "
"""""""""""""""""""""""""
" install vim-plug if not found
if !s:is_win && empty(glob($VIMHOME.'/autoload/plug.vim'))
    !wget -P ~/.vim/autoload/
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
"" General
Plug 'roxma/nvim-yarp' | Plug 'roxma/vim-hug-neovim-rpc'
Plug 'qpkorr/vim-bufkill'
Plug 'embear/vim-localvimrc'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'

"" C/Cpp
Plug 'octol/vim-cpp-enhanced-highlight'

"" Code check
Plug 'w0rp/ale'

"" Completion
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'ludovicchabant/vim-gutentags'
Plug 'honza/vim-snippets'

"" Editing
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

"" Files
Plug 'junegunn/fzf'
Plug 'tweekmonster/fzf-filemru'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

"" Git/VCS
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

"" Interface
Plug 'Shougo/denite.nvim'
Plug 'majutsushi/tagbar' " requires ctags
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'ryanoasis/vim-devicons'

"" Python
Plug 'davidhalter/jedi-vim'

"" Utils
Plug 'albfan/ag.vim'

"" Visuals
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'andymass/vim-matchup'

"" Color schemes
Plug 'romainl/Apprentice'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'junegunn/seoul256.vim'
Plug 'lifepillar/vim-solarized8'

"" Local plugins
call s:lsource($VIMCUSTOM . '/plugs.vim')

"" Initialize plugin system
call plug#end()

"""""""""""""
"  Visuals  "
"""""""""""""
set t_Co=256
set background=dark
set cursorline     " highlight current line
colorscheme gruvbox
syntax enable

""""""""""""
"  Indent  "
""""""""""""
set autoindent     " indent whe pasting
set cindent        " stricter rules for C programs
set colorcolumn=80 " maximum column width indicator
set expandtab      " spaces instead of TABS in INSERT mode
set linespace=1    " linespace height in pixels
set shiftwidth=4   " indenting is 4 spaces
set smartindent    " does the right thing (mostly) in programs
set softtabstop=4  " number of spaces in tab when editing
set tabstop=4      " number of visual spaces per TAB

""""""""""""""""
"  Completion  "
""""""""""""""""
set completeopt=menuone,preview,noinsert " for autocomplete plugins
set wildignorecase " ignore case for command mode
set wildmenu       " visual autocomplete for command menu
set wildmode=longest:full,full

""""""""""
"  Misc  "
""""""""""
set cf                    " ask confirm instead of failing
set clipboard=unnamedplus " to cp to and paste from system buffer
set encoding=utf-8
set hidden                " allow buffer switching without saving
set lazyredraw            " redraw only when we need to.
set linebreak             " wrap full words, do not split
set modeline              " enable file specific settings
set number                " line numbers
set shellslash            " use UNIX like directory separator
set showcmd               " show (partial) command in status line
set showmatch             " highlight matching brackets
set wrap                  " wrap enabled

""""""""""""""""""""""
"  Search & Replace  "
""""""""""""""""""""""
set hlsearch              " highlight matches
set ignorecase
set incsearch             " search as characters are entered
set smartcase             " if uppercase character inputed -> case sensitive
set wildignorecase

"""""""""""
"  Folds  "
"""""""""""
set foldenable            " enable folding
set foldlevelstart=10     " open most folds by default
set foldnestmax=10        " 10 nested fold max
set foldmethod=indent     " fold based on indent level

""""""""
"  UI  "
""""""""
" left padding hack
set foldcolumn=1  " enable fold column
" and hide text
highlight FoldColumn guibg=bg guifg=bg
" for gitgutter/signify
highlight SignColumn guibg=bg
set laststatus=2  " show status line
set noshowmode    " hide active mode name
set showtabline=2 " always show tabline

"""""""""
"  GUI  "
"""""""""
if has('gui')
    set guioptions-=T
    set guioptions-=e
    set winaltkeys=no

    " Maximize gvim at start
    "  if wmctrl is not installed
    "  set lines=999 columns=999
    if s:is_win
        au GUIEnter * simalt ~x
        set guifont=FuraCode\ NF:h11
    else
        augroup maximizewindow
            autocmd!
            autocmd VimEnter * call system('wmctrl -i -b add,maximized_vert,maximized_horz -r '.v:windowid)
        augroup END
        set guifont=Hack\ Nerd\ Font
    endif
endif

"""""""""""""""""""""""
"  Platform specific  "
"""""""""""""""""""""""
if s:is_win
    set clipboard=unnamed " copy to and paste from system buffer
endif

""""""""""""""
"  Commands  "
""""""""""""""

""""""""""""""""""
"  Key mappings  "
""""""""""""""""""
" Leader to SPACE
let mapleader = " "
let maplocalleader = ","

"" General
" Faster command mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
" move through wrapped lines
nnoremap j gj
nnoremap k gk
" yank same behavior as D, C
nnoremap Y y$
" turn off search highlight (press enter twice)
nnoremap <CR> :noh<CR>

""" .vimrc
" reloads the saved $MYVIMRC
nnoremap <silent> <leader>vs :source $MYVIMRC<CR>
" opens $MYVIMRC for editing
nnoremap <silent> <leader>v :e $MYVIMRC<CR>

""" buffers
" CTRL-i = CTRL-Tab now
nnoremap <silent> <C-Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprev<CR>
nnoremap <silent> <C-F4> :BD<CR>
nnoremap <silent> ZBD :BD<CR>
nnoremap <silent> <M-w> :BD<CR>
nnoremap <silent> ZBU :BU<CR>

" recently viewed buffer
nnoremap <silent> <M-q> :b#<CR>

""" completion
imap <expr> <C-n>   pumvisible() ? "\<Down>" : "\<C-n>"
imap <expr> <C-p>   pumvisible() ? "\<Up>" : "\<C-p>"
imap <expr> <space> pumvisible() ? "\<C-n>" : " "

""" files
" write file
nnoremap <C-s> :w<CR>
" reopen file
nnoremap <silent> ZE :e<CR>
" goto file directory
nnoremap <silent> ZD :cd %:p:h<CR>

""" insert mode
" move word back, front
inoremap <C-left> <C-o>B
inoremap <C-right> <C-o>W
" paste for INSERT and COMMAND modes
noremap! <C-S-v> <C-r>+
" switch case
inoremap <M-u> <C-[>g~iwea

""" useful funcs
" session
noremap <F2> :mksession! session.vim<CR>
noremap <silent> <C-F2> :source session.vim<CR>
" make
nnoremap <F7> :make<CR>
inoremap <F7> <ESC>:w<CR>:make<CR>
" execute current file
nnoremap <F5> :!./%:r<CR>
" make and run
nnoremap <C-F5> :w<CR>:make && ./%:r<CR>
inoremap <C-F5> <ESC>:w<CR>:make && ./%:r<CR>

""" windows
" close window
nnoremap <silent> q :close<CR>
" selection
noremap <C-w>l <C-w>L
noremap <C-w>k <C-w>K
noremap <C-w>j <C-w>J
noremap <C-w>h <C-w>H
noremap <C-q> <C-w>w
noremap Q <C-w>W
noremap <silent> <M-h> :wincmd h<CR>
noremap <silent> <M-j> :wincmd j<CR>
noremap <silent> <M-k> :wincmd k<CR>
noremap <silent> <M-l> :wincmd l<CR>

""" other
" macro
nnoremap <leader>q q

" open/closes folds
nnoremap zz za
nnoremap za zz

" diff
nnoremap <leader>dp :diffput<CR>
nnoremap <leader>dg :diffget<CR>

" indents
nnoremap <silent> <M->> :><CR>
nnoremap <silent> <M-<> :<<CR>

"" Plugins
""" ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

""" deoplete
inoremap <silent><expr> <C-Space>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#mappings#manual_complete()
            function! s:check_back_space() abort "{{{
            let col = col('.') - 1
            return !col || getline('.')[col - 1]  =~ '\s'
            endfunction"}}}

""" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""" fzf
noremap <silent> <C-p> :FZF<cr>
" fzf history
noremap <silent> <C-h> :History<cr>
" fzf selected word
noremap <silent> <leader>fw :FZF -q <cword><CR>
" fzf buffers
noremap <silent> <leader>fb :Buffers<cr>

""" NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>

""" tagbar
noremap <leader>t :Tagbar<CR>

""" UltiSnips
let g:UltiSnipsExpandTrigger = '<c-q>'

""" Unimpaired
nmap <C-S-up> <Plug>unimpairedMoveUp
nmap <C-S-down> <Plug>unimpairedMoveDown
vmap <C-S-up> <Plug>unimpairedMoveSelectionUpgv
vmap <C-S-down> <Plug>unimpairedMoveSelectionDowngv

""" vim-plug
nnoremap <silent> <F1> :call PlugHelp()<CR>

""""""""""""""""""""""
"  Plugins settings  "
""""""""""""""""""""""
"" airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" extensions
let g:airline_extensions = ['ale', 'branch', 'bufferline', 'tabline']

let g:airline#extensions#whitespace#enabled = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1 " enable/disable displaying buffers with a single tab
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#fnamecollapse = 3
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_tab_type = 1

let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 0

let g:airline#extensions#ctrlp#show_adjacent_modes = 1
let g:airline#extensions#ctrlp#color_template = 'insert'
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#ctrlp#color_template = 'visual'
let g:airline#extensions#ctrlp#color_template = 'replace'

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = '  '
let g:airline#extensions#ale#warning_symbol = '  '
let airline#extensions#ale#open_lnum_symbol = ' : #'
let airline#extensions#ale#close_lnum_symbol = ''

let g:airline_exclude_preview=1

" powerline symbols
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'
let g:airline_skip_empty_sections = 1
let g:airline_inactive_collapse=1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''

"" ALE
let g:ale_python_pylint_executable = 'pylint3'
" let g:ale_statusline_format = ['☀️️ %d', '🕯️ %d', '']
let g:ale_sign_error = ''
let g:ale_sign_warning = ''

"" auto-pairs
" TODO: fix issues with deoplete
" let g:AutoPairsMapCR=0
" inoremap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR><SID>AutoPairsReturn"

"" better-whitespace
highlight ExtraWhitespace ctermbg=darkred guibg=#990000

"" bufferline
let g:bufferline_echo = 0
let g:bufferline_active_buffer_left = ' '
let g:bufferline_active_buffer_right = ''
let g:bufferline_modified = '*'
let g:bufferline_rotate = 2
let g:bufferline_fixed_index = 1 "always first
let g:bufferline_pathshorten = 0

"" denite
" let s:menus = {}
" let s:menus.buffers = {
"             \ 'description': 'Buffers operations'
" }
" let s:menus.buffers.commands {
"             \ 'decription': 'Example'
" }
" let s:menus.my_commands.command_candidates = [
"             \ ['Split the window', 'vnew'],
"             \ ['Open zsh menu', 'Denite menu:zsh'],
"             \ ]

"" deoplete
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
    \ 'auto_complete': v:false,
    \ 'auto_complete_delay': 200,
    \ 'complete_method': 'completefunc',
    \ 'smart_case': v:false,
    \ })

" Jedi-vim compatibility issues
autocmd FileType python let g:deoplete#enable_at_startup = 0

"" fzf
" Match color scheme
let g:fzf_colors =
            \ { 'fg':    ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

"" indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

"" NERDTree
let NERDTreeShowHidden=1

"" UltiSnips
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "my-snips"]

"" vim-autotag
let g:autotagmaxTagsFileSize = 1024 * 1024 * 1024 " 1 GB

"" vim-gutentags
let g:gutentags_generate_on_new=0

"" vim-matchup
let g:matchup_override_vimtex = 1

"" vim-multiple-cursors
let g:multi_cursor_prev_key = '<C-[>'

"" vim-signify
let g:signify_line_highlight = 0
let g:signify_realtime = 1
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1
let g:signify_vcs_list = [ 'git' ]
highlight SignifySignAdd gui=bold guibg=bg guifg=#00af00 cterm=bold ctermfg=34
highlight SignifySignChange gui=bold guibg=bg guifg=#ffaf5f cterm=bold ctermfg=215
highlight SignifySignDelete gui=bold guibg=bg guifg=#d75f5f cterm=bold ctermfg=167

"""""""""""""""
"  Filetypes  "
"""""""""""""""
" keep it in the end to overwrite .vimrc bindings
filetype plugin on " filetype-specific settings
filetype plugin indent on " load filetype-specific indent files

""""""""""""""""""
"  Local config  "
""""""""""""""""""
call s:lsource($VIMCUSTOM . '/local.vimrc')

"""""""""""""""
"  Functions  "
"""""""""""""""
"" Autofolding .vimrc
" see http://vimcasts.org/episodes/writing-a-custom-fold-expression/
" vi.stackexchange.com/questions/3814/is-there-a-best-practice-to-fold-a-vimrc-file
""" defines a foldlevel for each line of code
function! VimFolds(lnum)
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

""" defines a foldtext
function! VimFoldText()
    " handle special case of normal comment first
    let s:info = '('.string(v:foldend-v:foldstart).' l)'
    if v:foldlevel == 1
        let s:line = ' ◇ '.getline(v:foldstart+1)[3:-2]
    elseif v:foldlevel == 2
        let s:line = '   ●  '.getline(v:foldstart)[3:]
    elseif v:foldlevel == 3
        let s:line = '     ▪ '.getline(v:foldstart)[4:]
    endif
    if strwidth(s:line) > 80 - len(s:info) - 3
        return s:line[:79-len(s:info)-3+len(s:line)-strwidth(s:line)].'...'.s:info
    else
        return s:line.repeat(' ', 80 - strwidth(s:line) - len(s:info)).s:info
    endif
endfunction

""" set foldsettings automatically for vim files
augroup fold_vimrc
    autocmd!
    autocmd FileType vim
                \ setlocal foldmethod=expr |
                \ setlocal foldexpr=VimFolds(v:lnum) |
                \ setlocal foldtext=VimFoldText() |
    "              \ set foldcolumn=2 foldminlines=2
augroup END

"" PlugHelp
function! PlugHelp()
    let str = matchstr(getline('.'), "'\\zs[^']\\+\\ze'")
    let str = fnamemodify(str, ":t")
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
