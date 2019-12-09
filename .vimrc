"""""""""""""
"  Defines  "
"""""""""""""
let $VIMHOME = '$HOME/.vim'
let $VIMCUSTOM = '$HOME/.vim/local' " host specific configs
let s:is_win = has('win64') || has('win32') || has('win16')
let s:is_macos = has('osx') || has('osxdarwin')

if s:is_win
    set runtimepath+=$HOME/.vim
endif

"" Functions
" source file if exists
function! s:lsource(filename)
    let expfilename = expand(a:filename)
    if filereadable(glob(expfilename))
        exec 'source ' . expfilename
    endif
endfunction

" for manual completion trigger
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

"""""""""""""""""""""""""
"  Plugins (vim-plug)  "
"""""""""""""""""""""""""
" install vim-plug if not found
if !s:is_win && empty(glob($VIMHOME . '/autoload/plug.vim'))
    !wget -P ~/.vim/autoload/
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
"" General
Plug 'qpkorr/vim-bufkill'
Plug 'embear/vim-localvimrc'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'

"" Code
Plug 'w0rp/ale'
Plug 'tpope/vim-sleuth'

"" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'ludovicchabant/vim-gutentags'
Plug 'honza/vim-snippets'

"" Editing
Plug 'tmsvg/pear-tree'
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

"" Languages
Plug 'Freedzone/kerbovim'

"" Python
Plug 'davidhalter/jedi-vim'

"" Utils
Plug 'albfan/ag.vim'

"" Visuals
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'andymass/vim-matchup'

"" Colors
Plug 'tsiemens/vim-aftercolors' " customize color schemes
" schemes
Plug 'romainl/Apprentice'
Plug 'zacanger/angr.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'flrnd/plastic.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'tyrannicaltoucan/vim-deep-space'

"" Local plugins
call s:lsource($VIMCUSTOM . '/plugs.vim')

"" Initialize plugin system
call plug#end()

""""""""""""""""""
"  Autocommands  "
""""""""""""""""""
" Neatly highlight left column
augroup hide_fold_col
    autocmd!
    autocmd ColorScheme * call vimrc#hi_margin_col()
    " color is not set until GUI is initialized, need extra autocmd
    autocmd GUIEnter * call vimrc#hi_margin_col()
augroup END

" Ignore case for completion only in cmd mode
augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END

""""""""""""""
"  Commands  "
""""""""""""""
" Get syntax group under cursor
command! GetSynGroup echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
            \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
            \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"

"""""""""""""
"  Visuals  "
"""""""""""""
set background=dark " required for dualed colorschemes
set colorcolumn=80  " maximum column width indicator
set cursorline      " highlight current line
set foldcolumn=1    " enable fold column for left margin
set laststatus=2    " show status line
set noshowmode      " hide active mode name
set showmatch       " highlight matching brackets
set showtabline=2   " show tabs
colorscheme gruvbox
syntax enable

""""""""""""
"  Indent  "
""""""""""""
set autoindent     " indent whe pasting
set cindent        " stricter rules for C programs
set expandtab      " spaces instead of TABS in INSERT mode
set linespace=1    " linespace height in pixels
set shiftwidth=4   " indenting is 4 spaces
set smarttab       " tab len according to tab options in other places
set softtabstop=4  " number of spaces in tab when editing

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
set confirm               " ask confirm instead of failing
set clipboard=unnamedplus " to cp to and paste from system buffer
set encoding=utf-8
set hidden                " allow buffer switching without saving
set lazyredraw            " redraw only when we need to.
set linebreak             " wrap full words, do not split
set number                " line numbers
set shellslash            " use UNIX like directory separator
set showcmd               " show (partial) command in status line
set updatetime=300

""""""""""""""""""""""
"  Search & Replace  "
""""""""""""""""""""""
set hlsearch              " highlight matches
set ignorecase
set incsearch             " search as characters are entered
set smartcase             " if uppercase character inputed -> case sensitive

"""""""""""
"  Folds  "
"""""""""""
set foldenable            " enable folding
set foldlevelstart=10     " open most folds by default
set foldnestmax=10        " 10 nested fold max
set foldmethod=indent     " fold based on indent level

"""""""""
"  GUI  "
"""""""""
if has('gui_running')
    set guioptions-=T
    set guioptions-=e
    set winaltkeys=no

    " Maximize gvim at start
    "  if wmctrl is not installed
    "  set lines=999 columns=999
    if s:is_win
        autocmd GUIEnter * simalt ~x
        set guifont=FuraCode\ NF:h11
    else
        augroup maximizewindow
            autocmd!
            autocmd VimEnter * call system('wmctrl -i -b add,maximized_vert,maximized_horz -r ' . v:windowid)
        augroup END
        set guifont=Hack\ Nerd\ Font
    endif
endif

"""""""""""""""""""""""
"  Platform specific  "
"""""""""""""""""""""""
if s:is_win
    let $VIMCONFIG = $VIMHOME " Windows uses 'vimfiles' as default, so change
    set clipboard=unnamed " copy to and paste from system buffer
endif

""""""""""""""""""
"  Key mappings  "
""""""""""""""""""
"" General
" Leader to SPACE
let mapleader = " "
let maplocalleader = ","
" Faster command mode
noremap ; :
noremap : ;
" move through wrapped lines
nnoremap j gj
nnoremap k gk
" yank same behavior as D, C
nnoremap Y y$
" dont overwrite register when replacing
xnoremap <expr> p 'pgv"'.v:register.'y'
" turn off search highlight (press enter twice)
nnoremap <silent> <CR> :noh<CR>

""" .vimrc
" reload $MYVIMRC
nnoremap <silent> <leader>vs :source $MYVIMRC<CR>
" edit $MYVIMRC
nnoremap <silent> <leader>v :e $MYVIMRC<CR>

""" buffers
" CTRL-i = CTRL-Tab in vim
nnoremap <silent> <C-Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprev<CR>
nnoremap <silent> <C-F4> :bw<CR>
nnoremap <silent> <M-w> :bw<CR>
nnoremap <silent> ZBD :bw<CR>
nnoremap <silent> ZBU :bu<CR>
" recently viewed buffer
nnoremap <silent> <M-q> :b#<CR>

""" command mode
cnoremap <C-v> <C-r>*
cnoremap <C-b> <C-a>
" shell life
cnoremap <C-a> <Home>

""" completion
inoremap <expr> <Tab>   pumvisible() ? "<Down>" : "<Tab>"
inoremap <expr> <S-Tab>   pumvisible() ? "<Up>" : "<C-d>"

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
" paste from system buffer
inoremap <C-S-v> <C-r>+
" switch case
inoremap <M-u> <C-[>g~iwea

""" useful funcs
" session
nnoremap <F2> :mksession! session.vim<CR>
nnoremap <silent> <C-F2> :source session.vim<CR>
" execute current file
nnoremap <F5> :!./%:r<CR>

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
" zoom window
nnoremap <silent> <leader>z :call vimrc#zoom()<CR>

""" other
" macro
nnoremap <leader>q q

" open/closes folds
noremap zz za
noremap za zz

" diff
nnoremap <leader>dp :diffput<CR>
nnoremap <leader>dg :diffget<CR>

" indents
nnoremap <silent> <M->> :><CR>
nnoremap <silent> <M-<> :<<CR>

" quickfix
" check $VIMHOME/ftplugin/qf.vim

"" Plugins
""" ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

""" better-whitespace
noremap <leader>s :StripWhitespace<CR>

""" bufkill
nnoremap <silent> <C-F4> :BW<CR>
nnoremap <silent> <M-w> :BW<CR>
nnoremap <silent> ZBD :BW<CR>
nnoremap <silent> ZBU :BU<CR>

""" coc.nvim
inoremap <silent><expr> <C-Space>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<SPACE>" :
            \ coc#refresh()

""" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""" EasyMotion
map <localleader><localleader> <Plug>(easymotion-prefix)
map <leader><leader> <Plug>(easymotion-s)

""" fzf
noremap <silent> <C-p> :FZF<cr>
" fzf history
noremap <silent> <C-h> :History<cr>
" fzf selected word
noremap <silent> <leader>fw :FZF -q <cword><CR>
" fzf buffers
noremap <silent> <leader>fb :Buffers<cr>

""" NERDTree
nnoremap <silent> <leader>n :NERDTreeFocus<cr>

""" pear-tree
imap <expr> <CR> pumvisible()  ? "<C-y>" : "<Plug>(PearTreeExpand)"
imap <C-c> <Plug>(PearTreeFinishExpansion)
imap <M-n> <Plug>(PearTreeJump)

""" tagbar
noremap <leader>t :Tagbar<CR>

""" UltiSnips
let g:UltiSnipsExpandTrigger = '<c-q>'

""" Unimpaired
nmap <C-S-up> [e
nmap <C-S-down> ]e
vmap <C-S-up> [e
vmap <C-S-down> ]e

""" vim-plug
nnoremap <silent> <F1> :call vimrc#plughelp()<CR>

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

let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = '  '
let g:airline#extensions#ale#warning_symbol = '  '
let airline#extensions#ale#open_lnum_symbol = ' : #'
let airline#extensions#ale#close_lnum_symbol = ''

let g:airline_exclude_preview=1

let g:airline_powerline_fonts=1
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
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_info = g:ale_sign_warning
let g:ale_sign_style_error = 'ﰊ'
let g:ale_sign_style_warning = g:ale_sign_style_error
" let g:ale_sign_error = ''
" let g:ale_sign_warning = ''
" let g:ale_sign_info = ''
" let g:ale_sign_style_error = ''
" let g:ale_sign_style_warning = ''

"" better-whitespace
highlight! def link ExtraWhitespace PMenuSel

"" bufferline
let g:bufferline_echo = 0
let g:bufferline_active_buffer_left = ' '
let g:bufferline_active_buffer_right = ''
let g:bufferline_modified = '*'
let g:bufferline_rotate = 2
let g:bufferline_fixed_index = 1 " always first
let g:bufferline_pathshorten = 0

"" coc.nvim

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

"" fzf
" Match color scheme
let g:fzf_colors =
          \ { 'fg':      ['fg', 'Normal'],
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

"" pear-tree
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

"" UltiSnips
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "my-snips"]

"" vim-gutentags
let g:gutentags_enabled=0
let g:gutentags_generate_on_new=0

"" vim-matchup
let g:matchup_override_vimtex = 1

"" vim-multiple-cursors
let g:multi_cursor_prev_key = '<C-[>'

"" vim-signify
let g:signify_line_highlight = 0
let g:signify_realtime = 0
let g:signify_sign_show_count = 1
let g:signify_sign_show_text = 1
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_change = 'ﰣ'

"" vim-sleuth
let g:sleuth_automatic = 0

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

""""""""""""""""
"  Vimrc fold  "
""""""""""""""""
setlocal modelineexpr
" vim:foldmethod=expr:foldexpr=vimrc#folds(v\:lnum):foldtext=vimrc#foldtext()
