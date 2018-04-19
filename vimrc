" Some styling
set background=dark
colorscheme hybrid_material

let mapleader = ',' 
" No vi more
set nocompatible
" Always wrap lon lines
set wrap
" find ctags file in current dir
set tags=./tags,tags;$HOME
" Show line numbers
set number
set ignorecase
set smartcase
set shortmess+=A
" auto save files when switching between buffers
set autowriteall
"Disable annoying beepings
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Enabling plugins
filetype plugin on

" set tabs settings
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

"folding settings
set foldmethod=syntax
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
" plugins settings
" easytags
let g:easytags_file = './tags'
let g:easytags_auto_highlight = 0
let g:easytags_events = ['BufWritePost']
let g:easytags_async = 1

" " ctrlp 
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'wr'
let g:ctrlp_buftag_types = {
            \'php': '--php-kinds=icdf'
            \}
" php-namespace
" "auto use namespace settings
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

" path mappings for vdebug
let g:vdebug_options={}
let g:vdebug_options.path_maps = {"/application/drimsim": "/home/jgne/code/drimsim/drimsim-backend/"}




" Running tests in vagrant from host machine
function! VagrantTransform(cmd) abort
  let vagrant_project = '/application/drimsim' 
  return 'vagrant ssh --command '.shellescape('cd '.vagrant_project.'; '.a:cmd)
endfunction

let g:test#custom_transformations = {'vagrant': function('VagrantTransform')}
let g:test#transformation = 'vagrant'

" " snippets settings 
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"






" ----------------Visuals---------------------
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" ----------------Split management----------------
set splitbelow
set splitright

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

" -------------------Searching----------------------------
set hlsearch
set incsearch





" -----------------Autocommands---------------------
" Automaticly source .vimrc file on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END


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

" Clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-leiningen'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'
Plug 'venantius/vim-eastwood'
Plug 'airblade/vim-gitgutter'
" ---Clojure
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elzr/vim-json'
Plug 'StanAngeloff/php.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'rking/ag.vim'
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
"For comment code
Plug 'scrooloose/nerdcommenter'
Plug 'joonty/vdebug'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'janko-m/vim-test'
call plug#end()

