set background=dark
colorscheme hybrid_material
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

" source $MYVIMRC reloads the saved $MYVIMRC
:nmap <Leader>s :source $MYVIMRC

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
:nmap <Leader>v :e $MYVIMRC

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
