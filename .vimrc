" New-school 
set nocompatible
set hidden
filetype off

" [ PLUGINS ]

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tomasr/molokai'
Plug 'jreese802/vim-sleuth'
" Plug 'Valloric/YouCompleteMe'
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
Plug 'vimwiki/vimwiki'
" Plug 'scrooloose/syntastic'
" Plugin 'zyedidia/literate.vim'
" Plug 'itchyny/vim-haskell-indent'
Plug 'neovimhaskell/haskell-vim'
" Plug 'sidorares/node-vim-debugger'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-unimpaired'
call plug#end()

source $HOME/.vim/align.vim
" source $HOME/.vim/powerlineesque.vim

syntax enable       " enable syntax processing
set background=dark " dark color scheme

let g:ycm_autoclose_preview_window_after_insertion=1

set updatetime=250

" [ KEYBINDS ]

" move between buffers 
" nnoremap <silent>gb :bn<CR>
" nnoremap <silent>gB :bp<CR>

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

" [ VIMWIKI ]
" bindings to open vimwiki
nmap gow <Plug>VimwikiIndex
nmap goW <Plug>VimwikiUiSelect
let g:vimwiki_list = [{'path': '~/vimwiki/',
            \ 'syntax': 'markdown',
            \'ext': '.md'}]
" let g:vimwiki_ext2syntax = {'.md': 'markdown',
"             \ '.mkd': 'markdown',
"             \ '.wiki': 'media'}


" [ SNEAK ]
" remap normal t and f to use Sneak plugin
if !empty(glob("~/.vim/plugged/vim-sleuth/plugin/sleuth.vim"))
    " echo 'Overriding F and T with Vim-Sleuth'
    map f <Plug>Sneak_f
    map F <Plug>Sneak_F
    map t <Plug>Sneak_t
    map T <Plug>Sneak_T
endif


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

" [ THEME ]
" 256 color mode
set t_Co=256
colorscheme molokai

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
nnoremap x "_x
nnoremap X "_X

" Searching

set incsearch " search as characters are entered
set hlsearch  " highlight matches
set ignorecase " case-insensitive search
set smartcase " case-sensitive search only when searching for capitals letters

"" [[ EnhancedDiff ]] 



" S H R U G B O I "
iabbrev shrug ¯\_(ツ)_/¯
