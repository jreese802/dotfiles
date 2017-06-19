" New-school 
set nocompatible
set hidden
filetype off

" [ PLUGINS ]

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tomasr/molokai'
Plug 'jreese802/vim-sleuth'
Plug 'Valloric/YouCompleteMe'
" Plug 'Shougo/neocomplete.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'danro/rename.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'wellle/targets.vim'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'chrisbra/vim-diff-enhanced'
call plug#end()

source $HOME/.vim/align.vim
" source $HOME/.vim/powerlineesque.vim

syntax enable       " enable syntax processing
set background=dark " dark color scheme

let g:ycm_autoclose_preview_window_after_insertion=1

" [ KEYBINDS ]

" move between buffers 
nnoremap <silent><C-A> :CtrlSpaceGoUp<CR>
nnoremap <silent><C-Q> :CtrlSpaceGoDown<CR>

" cursor line highlighting with <leader>c
hi CursorLine   cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! <CR>

" set python syntax with <leader>p (this is for all those terrible .py.php files)
nnoremap <Leader>p :set filetype=python <CR>
nnoremap <Leader>j :set filetype=javascript <CR>

" remove highlights with <leader><space>
nnoremap <leader><space> :nohlsearch<CR> 

" put clipboard register on <leader><leader>
nnoremap <leader><leader> "+
"
"
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

" show tabs 
set list
set listchars=tab:▸\ 

" [ THEME ]
" 256 color mode
set t_Co=256
colorscheme molokai

" [ AIRLINE ]
let g:airline#extensions#tabline#enabled = 1

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

" [ MISC ]

" eliminate insert-mode delay
set timeoutlen=1000 ttimeoutlen=0


" Code folding
set foldenable
set foldlevelstart=99

" Searching

set incsearch " search as characters are entered
set hlsearch  " highlight matches
set ignorecase " case-insensitive search
set smartcase " case-sensitive search only when searching for capitals letters

"" [[ EnhancedDiff ]] 



" S H R U G B O I "
" ¯\_(ツ)_/¯
