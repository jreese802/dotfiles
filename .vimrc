" New-school 
set nocompatible
set hidden
filetype off

" [ PLUGINS ]

call plug#begin('~/.vim/plugged')
Plug 'jreese802/vim-sleuth'             " Autodetect file settings and set vim appropriately
Plug 'tpope/vim-surround'               " Manipulate quotes, tags, brackets, etc
Plug 'tpope/vim-commentary'             " Manipulate comments
Plug 'tpope/vim-jdaddy'                 " JSON Text Objects -- gqij pretty prints from inside json object
Plug 'tpope/vim-fugitive'               " Git Interface for VIM
Plug 'tomasr/molokai'                   " Monokai-esque theme
Plug 'altercation/vim-colors-solarized' " Another Theme
Plug 'nightsense/seagrey'               " Another Theme
Plug 'vim-airline/vim-airline-themes'   " Airline Themes
Plug 'ajh17/VimCompletesMe'             " Async autocomplete via external program
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'danro/rename.vim'
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
Plug 'Quramy/tsuquyomi'                 " tyepscript support
Plug 'vim-syntastic/syntastic'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'dhruvasagar/vim-table-mode'       " Awesome Table creation and alignment.
Plug 'shime/vim-livedown'               " Auto-Updating mardown preview plugin. Opens in default browser
Plug 'godlygeek/tabular'                " Sweet alignment manipulation (TODO: custom aliases and shortcuts)
Plug 'MattesGroeger/vim-bookmarks'      " Awesome line-by-line bookmarks and annotations
Plug 'kien/rainbow_parentheses.vim'     " Rainbow Parens
call plug#end()

" turn on rainbow brackets
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.

let g:ycm_autoclose_preview_window_after_insertion=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0 " Don't auto open/close location list
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode="passive"
let g:syntastic_enable_signs=0
" nnoremap <F7> :SyntasticCheck<CR> :lopen<CR>

" table mode markdown-compatible
let g:table_mode_corner='|'

" ebook editing
au BufReadCmd *.epub call zip#Browse(expand("<amatch>"))

source $HOME/.vim/align.vim

" source $HOME/.vim/powerlineesque.vim

syntax enable       " enable syntax processing


set updatetime=250

" inoremap <F1> "


" fzf
set rtp+=/usr/local/opt/fzf

" [ KEYBINDS ]

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
"
"
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
set foldlevelstart=99

" x should always use the black-hole register
" nnoremap x "_x
" nnoremap X "_X

" Searching

set incsearch " search as characters are entered
set hlsearch  " highlight matches
set ignorecase " case-insensitive search
set smartcase " case-sensitive search only when searching for capitals letters

"" [[ EnhancedDiff ]] 



" S H R U G B O I "
iabbrev shrug ¯\_(ツ)_/¯



" [[ REMAPS BINDINGS ETC ]]
"paste default buffer in insert mode
inoremap <F1> "
" turn on syntastic
if !empty(glob("~/.vim/plugged/syntastic/plugin/syntastic.vim"))
  nnoremap <F7> :SyntasticCheck<CR> :lopen<CR>
endif
" easy tabularize shortcut
if !empty(glob("~/.vim/plugged/tabular/plugin/Tabular.vim"))
  vnoremap <leader>a :Tabularize /
endif
" cursor line highlighting
nnoremap <Leader>c :set cursorline! <CR>
" set syntax
nnoremap <Leader>p :set filetype=python <CR>
nnoremap <Leader>j :set filetype=javascript <CR>
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR> 

" clipboard shortcut for normal and visual mode
vnoremap <leader><leader> "+
nnoremap <leader><leader> "+
" <leader>d shortcut for 'delete to black hole'
nnoremap <leader>d "_d

" kinda wonky fullscreen shortcut
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
nnoremap x "_x
nnoremap X "_X

nnoremap mN :BookmarkPrev
