" Some styling
set background=dark
colorscheme hybrid_material

let mapleader = ',' 
" No vi more
set nocompatible
" Always wrap lon lines
set wrap

" Show line numbers
set number

"Disable annoying beepings
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Enabling plugins
filetype plugin on


" ----------------Visuals---------------------
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" ----------------Split management----------------
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-H> <C-W><C-H>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
" ----------------Key mappings----------------
" source $MYVIMRC reloads the saved $MYVIMRC
" :nmap <Leader>s :source $MYVIMRC<cr>

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
:nmap <Leader>v :tabedit $MYVIMRC<cr>
:nmap <Leader><space> :nohlsearch<cr>



" -------------------Searching----------------------------
set hlsearch
set incsearch





" -----------------Autocommands---------------------
" Automaticly source .vimrc file on save
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END


" -----------------Keymap cirillization
" set keymap=russian-jcukenwin
" set iminsert=0
" set imsearch=0
" highlight lCursor guifg=NONE guibg=Cyan



" -----------------------Plugins------------------------
call plug#begin()
Plug 'tpope/vim-sensible'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git integration
Plug 'tpope/vim-fugitive'

" Themes
" Plug 'tyrannicaltoucan/vim-quantum'
Plug 'kristijanhusak/vim-hybrid-material' 

call plug#end()
