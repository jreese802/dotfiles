" Settings for Vundle
set nocompatible
filetype off


" vim-plug Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tomasr/molokai'
call plug#end()

syntax enable  " enable syntax processing
set background=dark " dark color scheme

" spaces and tabs

set tabstop=4 " visual spaces displayed per tab
set softtabstop=4 " programmatic spaces per tab
set expandtab " spaces instead of tabs
set smarttab
set shiftwidth=4 " << and >> move line by 4 spaces

set backspace=indent,eol,start " backspace has more power

"UI Stuff
set number " show line numbers
set showcmd " show last command in the bottom bar
set wildmenu " visual autocomplete for commands
set lazyredraw " speeds up macros
set showmatch " bracket highlighting for [{()}]
set laststatus=2 " always show status line
set ruler " show cursor position in status bar
set scrolloff=3 "always keep the cursor 3 lines from the top or bottom
set relativenumber " show relative line numbers
set number " with relativenumber, show absolute line number for current line

"" THEME
" 256 color mode
set t_Co=256
" let g:rehash256 = 1
colorscheme molokai
" let g:molokai_original = 1



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

" Searching

set incsearch " search as characters are entered
set hlsearch " highlight matches

" /<space> to undo  highlighting
nnoremap <leader><space> :nohlsearch<CR> 


