set nocompatible
" -----------------------Plugins------------------------
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Themes
"Plug 'kristijanhusak/vim-hybrid-material' 
Plug 'morhetz/gruvbox'
" Move lines
Plug 'matze/vim-move'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-dispatch'

Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'elzr/vim-json'
Plug 'StanAngeloff/php.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" Plug 'rking/ag.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'moll/vim-node'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'html'] }
Plug 'isRuslan/vim-es6'
Plug 'aklt/plantuml-syntax'
Plug 'towolf/vim-helm'
Plug 'digitaltoad/vim-pug'
Plug 'Olical/conjure', {'tag': 'v4.15.0'}
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
"For comment code
Plug 'scrooloose/nerdcommenter'
Plug 'xolox/vim-misc'
Plug 'janko-m/vim-test'
" Plug 'kassio/neoterm'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
let g:coc_global_extensions = [
      \ 'coc-lists',
      \ 'coc-sh',
      \ 'coc-toml',
      \ 'coc-json',
      \ 'coc-eslint',
      \ 'coc-conjure',
      \ 'coc-highlight',
      \ 'coc-rls',
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
" set clipboard+=unnamedplus
"set lcs+=space:·
set conceallevel=0
set number
set ignorecase
set smartcase
set shortmess+=A                                                        
set omnifunc=syntaxcomplete#Complete
set autowriteall                                                        " auto save files when switching between buffers
set noerrorbells visualbell t_vb=                                       " disable annoyingt 
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab             "
set shiftround                                                          " for smart tabs symbols count
set foldmethod=syntax
set foldnestmax=10                                                      " deepest fold is 10 levels
set nofoldenable                                                        " dont fold by default
set foldlevel=1                                                         " this is just what i use
set list
set hlsearch
set incsearch
set completeopt=noinsert,menuone,noselect
set splitbelow
set splitright
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

let g:airline_powerline_fonts = 1
let mapleader = ',' 
let g:vim_json_syntax_conceal = 0
let g:gruvbox_contrast_dark='hard'
" let g:loaded_clipboard_provider = 1

let g:NERDSpaceDelims = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=[expand('~/.config/nvim/mysnippets')]
let g:UltiSnipsEditSplit="vertical"

let test#strategy = "neovim"
let test#neovim#term_position = "vert"
let g:test#javascript#mocha#executable = 'docker-compose exec api npx mocha'
autocmd GUIEnter * set visualbell t_vb=
filetype plugin on

au BufReadPost Dockerfile.* set syntax=dockerfile
" au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
" autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

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
" nnoremap <C-f> :Ag 
nnoremap <silent> <C-f> :Rg <C-R><C-W><CR>
nnoremap <C-g> :Rg 
nnoremap <leader>b :Buffers<CR>

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

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
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Remap for format selected region
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
command! JsonPretty execute ":%!python3 -m json.tool"
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
"Browse recent files
nmap <C-e> :History<cr>

"Show current file in nerd tree
map <leader>1 :NERDTreeFind<cr>
vnoremap <C-c> "*y


" Running tests keymaps
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tv :TestVisit<CR>

" -----------------Autocommands---------------------
" Automaticly source .vimrc file on save
augroup autosourcing
    autocmd!
    autocmd BufWritePost ~/.config/nvim/init.vim source %
augroup END
augroup FileTypeTetect
  autocmd!
  filetype plugin indent on
  autocmd BufEnter Makefile setlocal ts=4 sw=4 noexpandtab
augroup END
" -----------------------Complettion--------------------
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
au filetype php set omnifunc=LanguageClient#complete

colorscheme gruvbox
if g:colors_name == "gruvbox"
highlight Normal ctermbg=16 guibg=#000000
endif
