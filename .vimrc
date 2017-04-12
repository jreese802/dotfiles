" New-school 
set nocompatible
filetype off

" [ PLUGINS ]

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tomasr/molokai'
Plug 'jreese802/vim-sleuth'
Plug 'Valloric/YouCompleteMe'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'danro/rename.vim'
call plug#end()

source $HOME/.vim/align.vim

syntax enable       " enable syntax processing
set background=dark " dark color scheme

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
"
" 256 color mode
set t_Co=256
colorscheme molokai

" [ MISC ]

" nnoremap <leader>b :NERDTreeToggle<CR>

" eliminate insert-mode delay
set timeoutlen=1000 ttimeoutlen=0


" Code folding
set foldenable
set foldlevelstart=99
" <space> to toggle folding on block
nnoremap <space> za

" cursor line highlighting with \c
hi CursorLine   cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! <CR>

" set python syntax with \p
nnoremap <Leader>p :set syntax=python <CR>
nnoremap <Leader>j :set syntax=javascript <CR>

" Searching

set incsearch " search as characters are entered
set hlsearch  " highlight matches
set ignorecase " case-insensitive search
set smartcase " case-sensitive search only when searching for capitals letters

" /<space> to undo  highlighting
nnoremap <leader><space> :nohlsearch<CR> 


