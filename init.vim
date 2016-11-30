call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive' " Git support
Plug 'scrooloose/nerdtree' " file/directory broswer
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline' " status bar
Plug 'vim-airline/vim-airline-themes' " status bar theme
Plug 'scrooloose/syntastic' " linter

Plug 'kien/ctrlp.vim'

Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'
Plug 'vim-pencil'
Plug 'mattn/emmet-vim'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'fmoralesc/molokayo'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'junegunn/rainbow_parentheses.vim'

" Javascript Plugins
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'moll/vim-node'
Plug 'elzr/vim-json'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }

" HTML & CSS
Plug 'othree/html5-syntax.vim'
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ap/vim-css-color'

" Python Plugins

Plug 'yssource/python.vim'
Plug 'python_match.vim'
Plug 'pythoncomplete'

" Elixir Plugins
Plug 'elixir-lang/vim-elixir'
Plug 'carlosgaldino/elixir-snippets'
Plug 'mattreduce/vim-mix'
Plug 'slashmili/alchemist.vim'

" Scala Plugins
Plug 'derekwyatt/vim-scala'

" Elm Plugins
Plug 'lambdatoast/elm.vim'

" Markdown Plugin
Plug 'tpope/vim-markdown'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'rhysd/conflict-marker.vim'
Plug 'jiangmiao/auto-pairs'
"Plug 'bling/vim-bufferline'
Plug 'easymotion/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" Rust Plugins
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'sebastianmarkow/deoplete-rust'
call plug#end()

set lazyredraw

set mouse=a
set wrap linebreak nolist
"Set Leader to ,
let mapleader = ','

" some defaults
set shiftwidth=2                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=2                   " An indentation every two columns
set softtabstop=2               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Set color and guides

" rust
set hidden
let g:racer_cmd = $HOME.'/.cargo/bin/racer'
let $RUST_SRC_PATH=$RUST_SRC_PATH
let g:racer_experimental_completer = 1

let g:deoplete#sources#rust#racer_binary=$HOME.'/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path=$RUST_SRC_PATH


if (has("termguicolors"))
  set termguicolors
endif
syntax enable
colorscheme molokayo

set background=dark

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
set guifont=Sauce_Code_Powerline:h12

au VimEnter * RainbowParentheses
set nu " show line number
"Enable Powerline Fonts for Airline
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
"Enable linting of js files as jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
"Enable syntastic to lint using ESlint
let g:syntastic_javascript_checkers = ['eslint']

" auto change working directory based upon current file within buffer
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

"NerdTree
map <C-e> <plug>NERDTreeTabsToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Search
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present

" Change W and Q to w and q
:command WQ wq
:command Wq wq
:command W w
:command Q q

"NeoComplete
let g:deoplete#enable_at_startup = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets/snippets'

"backup files
set backup

set undofile
set undolevels=1000
set undoreload=10000
set backupdir=~/.config/nvim/backup_files//
set directory=~/.config/nvim/swap_files//
set undodir=~/.config/nvim/undo_files//

autocmd User Node
      \ if &filetype == "javascript" |
      \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
      \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
      \ endif

let g:syntastic_python_python_exec = 'python3'

let g:jsx_ext_required = 0

set foldmethod=syntax
set foldlevelstart=1
set foldnestmax=2

let javaScript_fold=1         " JavaScript

autocmd BufWritePre * %s/\s\+$//e
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:indent_guides_auto_colors = 1
