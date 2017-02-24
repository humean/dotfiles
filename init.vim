call plug#begin('~/.local/share/nvim/plugged')

" ======
" General Plugins
" ======

" Airline statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Ale Linter Plugin
Plug 'w0rp/ale'

" Alignment plugin - see config below for use
Plug 'junegunn/vim-easy-align'

" Autopair stuff like (), '', and []
Plug 'jiangmiao/auto-pairs'

" Colour Themes
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'

" Comment functions - use: <Leader>c<space>
Plug 'scrooloose/nerdcommenter'

" Deoplete - auto-completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Editor config - because people get angry about style!
Plug 'editorconfig/editorconfig-vim'

" FZF fuzzy file finder - use: :Files and :Commits
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/conflict-marker.vim'

" Indent guides - highlights cols
Plug 'nathanaelkane/vim-indent-guides'

" NerdTree File Navigation - configured to open with <C-e> below
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Rainbow parentheses
Plug 'junegunn/rainbow_parentheses.vim'

" Repeat.vim - makes . behave nicer
Plug 'tpope/vim-repeat'

" Sensible defaults
Plug 'tpope/vim-sensible'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Split terminal - use: :Term, :VTerm
Plug 'vimlab/split-term.vim'

" Surround - vim-surround - use: cs or ds to change or get rid of surrounds
" eg: cs]{ [hello] -> {hello}
" eg: ds] [hello] -> hello
Plug 'tpope/vim-surround'

" ======
" Language Specific Plugins
" ======

" Elixir Plugins
Plug 'elixir-lang/vim-elixir'
Plug 'carlosgaldino/elixir-snippets'
Plug 'mattreduce/vim-mix'
Plug 'slashmili/alchemist.vim'

" HTML & CSS
Plug 'othree/html5-syntax.vim'
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'chrisbra/Colorizer'
Plug 'mattn/emmet-vim' " emmet for HTML syntax generation - use: <c-y><leader>

" Javascript & JSON Syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'
Plug 'moll/vim-node'
Plug 'ternjs/tern_for_vim',       { 'do': 'npm install --cache-min Infinity --loglevel http' }
Plug 'carlitux/deoplete-ternjs',  { 'do': 'npm install --cache-min Infinity --loglevel http -g tern' }
Plug 'neovim/node-host',          { 'do': 'npm install --cache-min Infinity --loglevel http' }

" Markdown Plugin
Plug 'tpope/vim-markdown'

" Python Plugins
Plug 'yssource/python.vim'
Plug 'python_match.vim'
Plug 'pythoncomplete'

" Rust Plugins
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'rhysd/rust-doc.vim'

" TOML Plugins
Plug 'cespare/vim-toml'

" Scala Plugins
Plug 'derekwyatt/vim-scala'
call plug#end()

" =========
" Non-Plugin specific (mostly)
" =========

" set leader
let mapleader = ','

" enable mouse
set mouse=a

" fixes problems around file watching - eg webpack-dev-server
set backupcopy=yes

" Set color
if (has("termguicolors"))
  set termguicolors
endif
syntax enable
try
  set background=dark
  let g:gruvbox_contrast_dark="medium"
  colorscheme gruvbox " uses plugin, so putting in try/catch
catch
endtry

" highlight col 80
let &colorcolumn="80"

" show line number
set nu  " show absolute line number
set rnu " show relative line number

" Indent defaults
set shiftwidth=2  " Use indents of 2 spaces
set expandtab     " Tabs are spaces, not tabs
set tabstop=2     " An indentation every two columns
set softtabstop=2 " Let backspace delete indent
set nojoinspaces  " Prevents inserting two spaces after punctuation on a join (J)
set splitright    " Puts new vsplit windows to the right of the current
set splitbelow    " Puts new split windows to the bottom of the current

" Copy to system clipboard using leader modifier
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg
nnoremap  <leader>y  "+y
nnoremap  <leader>yy "+yy

" Paste to system clipboard using leader
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Change W and Q to w and q - so I fuck up less
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Search
set showmatch      " Show matching brackets/parenthesis
set incsearch      " Find as you type search
set hlsearch       " Highlight search terms
set winminheight=0 " Windows can be 0 line high
set ignorecase     " Case insensitive search
set smartcase      " Case sensitive when uc present

" backup files
set backup
set undofile
set undolevels=1000
set undoreload=10000
" might need to create these directories manually
set backupdir=~/.config/nvim/backup_files//
set directory=~/.config/nvim/swap_files//
set undodir=~/.config/nvim/undo_files//

" remove trailing whitespace on file save
autocmd BufWritePre * %s/\s\+$//e

" ctrl-(h|j|k|l) move to split buffers
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" =========
" Plugin specific (mostly)
" =========

" deoplete autocomplete at startup
let g:deoplete#enable_at_startup = 1

" indent guides from vim-indent-guides
let g:indent_guides_start_level           = 2
let g:indent_guides_guide_size            = 1
let g:indent_guides_enable_on_vim_startup = 1

" Show rainbow parentheses
au VimEnter * RainbowParentheses

" Run prettier on javascript via 'gq'
" Doesn't use a plugin, but instead external cli (npm -g install prettier)
autocmd FileType javascript set formatprg=prettier\ --stdin\ --single-quote
autocmd FileType javascript.jsx set formatprg=prettier\ --stdin\ --single-quote

" Setting up snippets from ultisnips
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Javascript syntax stuff
let g:javascript_plugin_flow = 1 " flow types syntax highlighting - vim-javascript
let g:jsx_ext_required       = 0 " jsx syntax highlighting in .js files - vim-jsx

" Ale settings
let g:ale_statusline_format    = ['✗ %d', '⚠ %d', '◈ ok']
let g:ale_echo_msg_format      = '[%linter%] %s [%severity%]'
let g:ale_lint_on_save         = 1
let g:ale_lint_on_text_changed = 0
let g:ale_sign_column_always   = 1
let g:ale_lint_on_enter        = 1
let g:ale_sign_error           = '✗'
let g:ale_sign_warning         = '⚠'

" enabled Colorizer
let g:colorizer_auto_filetype='css,html,js,javascript,javascript.jsx'

" Airline settings
let g:airline_theme           = 'gruvbox'
let g:airline_powerline_fonts = 1 " Use powerline fonts
let g:airline_section_error   = '%{ALEGetStatusLine()}' " use ALE statusline errors

"NerdTree
map <C-e> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks    = 1
let NERDTreeIgnore           = ['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode        = 0
let NERDTreeQuitOnOpen       = 1
let NERDTreeMouseMode        = 2
let NERDTreeShowHidden       = 1
let NERDTreeKeepTreeInNewTab = 1

" tern
let g:tern_map_keys            = 1 "enable keyboard shortcuts
let g:tern_show_argument_hints = 'on_hold' "show argument hints

" rust
set hidden
let g:rustfmt_autosave             = 1
let g:racer_cmd                    = $HOME.'/.cargo/bin/racer'
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
