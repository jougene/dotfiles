" settings 
set background=dark
set nocompatible
set nowrap
set conceallevel=0
set number
set ignorecase
set smartcase
set shortmess+=A                                                        
set omnifunc=syntaxcomplete#Complete
set autowriteall                                                        " auto save files when switching between buffers
set noerrorbells visualbell t_vb=                                       " disable annoying beepings
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab             "
set shiftround                                                          " 
set foldmethod=syntax
set foldnestmax=10                                                      "deepest fold is 10 levels
set nofoldenable                                                        "dont fold by default
set foldlevel=1                                                         "this is just what i use
"set clipboard+=unnamedplus
set hlsearch
set incsearch
set completeopt=noinsert,menuone,noselect
set splitbelow
set splitright
set tags=./tags,tags;$HOME

colorscheme hybrid_material
let g:airline_powerline_fonts = 1
let g:hybrid_transparent_background = 1
let mapleader = ',' 
let g:vim_json_syntax_conceal = 0

let g:easytags_file = './tags'
let g:easytags_auto_highlight = 0
let g:easytags_events = ['BufWritePost']
let g:easytags_async = 1

let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'wr'
let g:ctrlp_buftag_types = {
            \'php': '--php-kinds=icdf'
            \}
let g:ctrlp_custom_ignore = 'vendor\|git'
" find ctags file in current dir
" Show line numbers
" " syntastic
let g:syntastic_php_checkers = ["php", "phpcs"]
let g:syntastic_php_phpcs_args = "--standard=PSR2"

" " snippets settings 
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsEditSplit="vertical"

autocmd GUIEnter * set visualbell t_vb=
filetype plugin on

" " phpactor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>
nmap <Leader>m :call phpactor#ContextMenu()<CR>

autocmd FileType php setlocal omnifunc=phpactor#Complete



" ----------------Split management----------------

nmap <C-H> <C-W><C-H>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
" ----------------Key mappings----------------
" source $MYVIMRC reloads the saved $MYVIMRC
" :nmap <Leader>s :source $MYVIMRC<cr>

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nmap <Leader>v :tabedit $MYVIMRC<cr>
nmap <Leader><space> :nohlsearch<cr>
nmap <Leader><Leader> :NERDTreeToggle<cr>
"Browse for functions vars and so on
nmap <C-r> :CtrlPBufTag<cr>
"Browse recent files
nmap <C-e> :CtrlPMRUFiles<cr>

imap <C-o> <esc>o
"Show current file in nerd tree
map <leader>1 :NERDTreeFind<cr>
nmap <F8> :TagbarToggle<CR>
vnoremap <C-c> "*y


" Running tests keymaps
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>s :TestSuite<CR>
nmap <silent> <leader>a :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" -----------------Autocommands---------------------
" Automaticly source .vimrc file on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost ~/.config/nvim/init.vim source %
augroup END

" -----------------------Complettion--------------------
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information


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
" Move lines
Plug 'matze/vim-move'

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jasoncodes/ctrlp-modified.vim'
Plug 'elzr/vim-json'
Plug 'StanAngeloff/php.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'rking/ag.vim'
Plug 'jiangmiao/auto-pairs'
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
"For comment code
Plug 'scrooloose/nerdcommenter'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'janko-m/vim-test'
" Syntax checkers
Plug 'vim-syntastic/syntastic'
Plug 'elixir-editors/vim-elixir'
" Auto Completion
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug 'phpactor/ncm2-phpactor'
Plug 'adoy/vim-php-refactoring-toolbox'
call plug#end()

