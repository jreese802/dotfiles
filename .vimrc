" New-school
set nocompatible
set hidden
filetype on
syntax enable

" [ PLUGINS ]

call plug#begin('~/.vim/plugged')
Plug 'jreese802/vim-sleuth'             " Autodetect file settings and set vim appropriately
Plug 'tpope/vim-surround'               " Manipulate quotes, tags, brackets, etc
Plug 'tpope/vim-commentary'             " Manipulate comments
Plug 'tpope/vim-jdaddy'                 " JSON Text Objects -- gqij pretty prints from inside json object
Plug 'tpope/vim-fugitive'               " Git Interface for VIM
Plug 'tpope/vim-rhubarb'
Plug 'tomasr/molokai'                   " Monokai-esque theme
Plug 'altercation/vim-colors-solarized' " Another Theme
Plug 'nightsense/seagrey'               " Another Theme
Plug 'vim-airline/vim-airline-themes'   " Airline Themes
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'          " Sweet statusbar. Hard to customize though.
                                        " TODO: Create my own status bar
Plug 'vim-ctrlspace/vim-ctrlspace'      " Neat interface for workspaces, buffers and tabs.
                                        " NOTE: There are probably better alternatives to ctrlspace out there
Plug 'wellle/targets.vim'               " positional text objects ahead and behind
Plug 'justinmk/vim-sneak'               " One and two character searches. next/prev with ;/,
Plug 'tpope/vim-repeat'                 " Enables . operator for surrount, commentary, targets, etc.
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'chrisbra/vim-diff-enhanced'       " Better vim diff? Not sure what it changes
Plug 'vimwiki/vimwiki'                  " Personal wiki CMS
                                        " Plug 'itchyny/vim-haskell-indent'
Plug 'neovimhaskell/haskell-vim'
                                        " Plug 'sidorares/node-vim-debugger'
Plug 'airblade/vim-gitgutter'           " Symbols showing lines added/removed/changed
Plug 'tpope/vim-unimpaired'             " Set of shortcuts focused around using the brackets
                                        " vim-unimpared; e.g. ]q -> next quickfix result;
" Plug 'ternjs/tern_for_vim'              " IDE like hints for JS
" Plug 'vim-syntastic/syntastic'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'       " tyepscript support
Plug 'Quramy/tsuquyomi'                 " tyepscript support
Plug 'dhruvasagar/vim-table-mode'       " Awesome Table creation and alignment.
Plug 'shime/vim-livedown'               " Auto-Updating mardown preview plugin. Opens in default browser
Plug 'godlygeek/tabular'                " Sweet alignment manipulation (TODO: custom aliases and shortcuts)
Plug 'MattesGroeger/vim-bookmarks'      " Awesome line-by-line bookmarks and annotations
Plug 'kien/rainbow_parentheses.vim'     " Rainbow Parens
Plug 'w0rp/ale'                         " good async linter
Plug '/usr/local/opt/fzf'               " fuzzy finder, better than ctrlspace
Plug 'junegunn/fzf.vim'                 " fuzzy finder, better than ctrlspace
Plug 'Yggdroot/hiPairs'                 " highlight matching/unbalanced parens
Plug 'bronson/vim-visual-star-search'   " start * or # search from visual mode
call plug#end()

" turn on rainbow brackets
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" table mode markdown-compatible
let g:table_mode_corner='|'



set updatetime=250

" inoremap <F1> "


" fzf
set rtp+=/usr/local/opt/fzf

" [ KEYBINDS ]

noremap <leader>ff :Files
noremap <leader>fb :Buffers
noremap <leader>fa :Ag
noremap <leader>fw :Windows
noremap <leader>fc :Commits
noremap <leader>fC :Commands
noremap <leader>fm :Maps
noremap <leader>fh :Helptags

" vnoremap \aa :Tab /:\zs<CR>

" move between buffers
" nnoremap <silent>gb :bn<CR>
" nnoremap <silent>gB :bp<CR>

" cursor line highlighting
hi CursorLine   cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkred guifg=white
" nnoremap <Leader>c :set cursorline! <CR>

" set python syntax with <leader>p (this is for all those terrible .py.php files)
" nnoremap <Leader>p :set filetype=python <CR>
" nnoremap <Leader>j :set filetype=javascript <CR>

" remove highlights with <leader><space>
" nnoremap <leader><space> :nohlsearch<CR>

" put clipboard register on <leader><leader>
" nnoremap <leader><leader> "+

" delete to null register
" nnoremap <leader>d "_d

" fullscreen window
" nnoremap <leader>f 

" [ ALE ]
" for linting and prettying
let g:ale_linters = {
      \ 'python': ['flake8'],
      \ 'javascript': ['eslint'],
      \ 'typescript': ['tsserver'] }
let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'typescript': ['prettier'] }
" let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_set_quickfix = 1

let g:ale_python_flake8_executable = '/usr/local/bin/python3'
let g:ale_python_flake8_options = '-m flake8'
let g:ale_python_flake8_use_global = 0

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nnoremap gp :silent %!prettier --stdin --trailing-comma all --single-quote<CR>



" [ VIMWIKI ]
" bindings to open vimwiki
nmap gow <Plug>VimwikiIndex
nmap goW <Plug>VimwikiUiSelect
" let g:vimwiki_list = [{'path': '~/vimwiki/',
"             \ 'syntax': 'markdown',
"             \'ext': '.md'}]
" let g:vimwiki_ext2syntax = {'.md': 'markdown',
"             \ '.mkd': 'markdown',
"             \ '.wiki': 'media'}


" [ SNEAK ]


" [ INDENTATION ]

set tabstop=4     " visual spaces displayed per tab
set softtabstop=4 " programmatic spaces per tab
set expandtab     " spaces instead of tabs
set smarttab
set shiftwidth=4  " << and >> move line by 4 spaces

set backspace=indent,eol,start " backspace has more power

" [ USER INTERFACE ]
set number         " show line numbers
set relativenumber " show relative line numbers
set showcmd        " show last command in the bottom bar
set wildmenu       " visual autocomplete for commands
set lazyredraw     " speeds up macros
set showmatch      " bracket highlighting for [{()}]
set laststatus=2   " always show status line
set ruler          " show cursor position in status bar
set scrolloff=3    " always keep the cursor 3 lines from the top or bottom

" [ AUTOCMDS ]
" if !exists("autocommands_loaded")
"   let autocommands_loaded = 1
"   au ...
" endif
" build python and js files with gb
autocmd FileType python nnoremap <buffer> gb :!python %<CR>
autocmd FileType javascript nnoremap <buffer> gb :!node %<CR>
" autocmd FileType python nnoremap <buffer> gb call RunFile(python)<CR>
" autocmd FileType javascript nnoremap <buffer> gb call RunFile(javascript)<CR>

" jump to the last location when re-opening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif


" function! RunFile(buildSystem)
"     write
"     ! echo a:buildSystem %
"     !a:buildSystem %
" endfunction


" show tabs
set list
set listchars=tab:▸\ 

" [ THEME/SCHEME ]
" 256 color mode
set t_Co=256
" colorscheme molokai
colorscheme seagrey-dark

set background=dark
let g:airline_theme='base16_oceanicnext'

" colorscheme solarized

" [ AIRLINE ]
let g:airline#extensions#tabline#enabled = 1
" let g:airline_section_y = (fileencoding, fileformat)
let g:airline#extensions#ctrlspace#enabled = 1



" [ CTRLSPACE ]
set showtabline=0
set wildignore=.git,.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,tags,*.tags
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -lf --nocolor -g ""'
endif

let g:CtrlSpaceUseMouseAndArrowsInTerm = 1
let g:CtrlSpaceSymbols =
        \{
            \"Zoom": "🔎  ",
            \"BM": "❤️ ",
            \"IM": "Ⓜ️ ",
        \}
" let g:airline_exclude_preview = 1
" Workspace Autosave/load
let g:CtrlSpaceSaveWorkspaceOnExit = 0
let g:CtrlSpaceLoadLastWorkspaceOnStart = 0
let g:CtrlSpaceSaveWorkspaceOnSwitch = 0

" To make the vim-ctrlspace integration work you will need to make the
" ctrlspace statusline function call the correct airline function. Therefore
" add the following line into your .vimrc: >

let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"

" [ MISC ]

" eliminate insert-mode delay
set timeoutlen=1000 ttimeoutlen=0

" open splits in bottom/right
" set splitbelow
" set splitright

" Code folding
set foldenable
set foldmethod=syntax

" x should always use the black-hole register
" nnoremap x "_x
" nnoremap X "_X

" Searching

set incsearch " search as characters are entered
set hlsearch  " highlight matches
set ignorecase " case-insensitive search
set smartcase " case-sensitive search only when searching for capitals letters


" S H R U G B O I "
iabbrev shrug ¯\_(ツ)_/¯



" [[ REMAPS BINDINGS ETC ]]

" turn on syntastic
if !empty(glob("~/.vim/plugged/syntastic/plugin/syntastic.vim"))
  nnoremap <F7> :SyntasticCheck<CR> :lopen<CR>
endif

" easy tabularize shortcut (if installed)
if !empty(glob("~/.vim/plugged/tabular/plugin/Tabular.vim"))
  vnoremap <leader>a :Tabularize /
endif

" cursor line highlighting
nnoremap <Leader>c :set cursorline! <CR>

" shortcuts to set file syntax
" used for our .py.php files or warner's .es7 files
nnoremap <Leader>p :set filetype=python <CR>
nnoremap <Leader>j :set filetype=javascript <CR>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" clipboard shortcut for normal and visual mode
noremap <leader><leader> "+

" <leader>d shortcut for 'delete to black hole'
nnoremap <leader>d "_d

" kinda wonky fullscreen shortcut
" maximizes window width then height
nnoremap <leader>f 


" remap normal t and f to use Sneak plugin
"   Doesn't fail if sneak isn't installed!
if !empty(glob("~/.vim/plugged/vim-sleuth/plugin/sleuth.vim"))
    " echo 'Overriding F and T with Vim-Sleuth'
    map f <Plug>Sneak_f
    map F <Plug>Sneak_F
    map t <Plug>Sneak_t
    map T <Plug>Sneak_T
endif

" x should always use the black-hole register
" I hate when I yank something and accidentally overwrite it with x
nnoremap x "_x
nnoremap X "_X

" I use registers way more than marks
" so swap them around
noremap ' "
noremap " '


" macros for copy above and copy below
" (basically normal mode mappings for i_CTRL_E and i_CTRL-Y)
let @y='a'
let @e='a'
