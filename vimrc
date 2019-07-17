set nocompatible
" -----------------------Plugins------------------------
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'lxhillwind/leader-clipboard'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Git integration
Plug 'tpope/vim-fugitive'
" Themes
"Plug 'kristijanhusak/vim-hybrid-material' 
Plug 'morhetz/gruvbox'
" Move lines
Plug 'matze/vim-move'
Plug 'terryma/vim-multiple-cursors'
" Async linting and fixing
Plug 'w0rp/ale'
Plug 'tpope/vim-dispatch'

Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'elzr/vim-json'
Plug 'StanAngeloff/php.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'rking/ag.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'moll/vim-node'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'aklt/plantuml-syntax'
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
" Auto Completion
"Plug 'autozimu/LanguageClient-neovim', {
    "\ 'branch': 'next',
    "\ 'do': 'bash install.sh',
    "\ }
"Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-tslint',
      \ 'coc-lists',
      \ 'coc-sh',
      \ 'coc-json',
      \ 'coc-eslint',
      \ 'coc-yaml',
      \ 'coc-highlight',
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-docker',
      \ 'coc-diagnostic',
      \]
"Plug 'adoy/vim-php-refactoring-toolbox'
call plug#end()

" settings 
set background=dark
set nowrap
set lcs+=space:·
set conceallevel=0
set number
set ignorecase
set smartcase
set shortmess+=A                                                        
set omnifunc=syntaxcomplete#Complete
set autowriteall                                                        " auto save files when switching between buffers
set noerrorbells visualbell t_vb=                                       " disable annoyingt 
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab             "
set shiftround                                                          " for smart tabs symbols count
set foldmethod=syntax
set foldnestmax=10                                                      " deepest fold is 10 levels
set nofoldenable                                                        " dont fold by default
set foldlevel=1                                                         " this is just what i use
set hlsearch
set incsearch
set completeopt=noinsert,menuone,noselect
set splitbelow
set splitright
set tags=./tags,tags;$HOME
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

let g:airline_powerline_fonts = 1
let mapleader = ',' 
let g:vim_json_syntax_conceal = 0
let g:gruvbox_contrast_dark='hard'

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
" linters and fixers
let g:ale_fix_on_save = 0
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
let g:ale_php_phpcs_standard = 'PSR2'
let g:ale_linters = {
    \ 'php': ['php', 'phpcs', 'phpmd']
    \ }
let g:ale_fixers = {
      \ 'php': ['php_cs_fixer'],
      \ }

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=[expand('~/.config/nvim/mysnippets')]
let g:UltiSnipsEditSplit="vertical"

let test#strategy = "neovim"
autocmd GUIEnter * set visualbell t_vb=
filetype plugin on

" ----------------Split management----------------

nmap <C-H> <C-W><C-H>
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-=> <C-W>=
" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with line wrapping on, this can cause the cursor to actually skip a few lines on the screen because it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down' to mean the next line on the screen
nmap j gj
nmap k gk
nnoremap ff :normal! gg=G<CR>
nnoremap <silent> <Leader>ag :exe 'Ag!' expand('<cword>')<cr> 
nnoremap <C-\> :call NERDComment(0,"toggle")<CR>
vnoremap <C-\> :call NERDComment(0,"toggle")<CR>
nnoremap <C-p> :GFiles .<CR>

""" CoC
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" ----------------Key mappings----------------
" source $MYVIMRC reloads the saved $MYVIMRC
" :nmap <Leader>s :source $MYVIMRC<cr>

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nmap <Leader>v :tabedit $MYVIMRC<cr>
nmap <Leader><space> :nohlsearch<cr>
nmap <Leader><Leader> :NERDTreeToggle<cr>
" close all other buffers
nmap <Leader>w :only<cr>
nmap <Leader><Leader> :NERDTreeToggle<cr>
"Browse for functions vars and so on
nmap <C-r> :CtrlPBufTag<cr>
"Browse recent files
nmap <C-e> :History<cr>

"Show current file in nerd tree
map <leader>1 :NERDTreeFind<cr>
vnoremap <C-c> "*y


" Running tests keymaps
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>a  :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>

" -----------------Autocommands---------------------
" Automaticly source .vimrc file on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost ~/.config/nvim/init.vim source %
augroup END

" -----------------------Complettion--------------------
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
au filetype php set omnifunc=LanguageClient#complete

colorscheme gruvbox
if g:colors_name == "gruvbox"
highlight Normal ctermbg=16 guibg=#000000
endif
