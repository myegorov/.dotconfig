set nocompatible
filetype off

" Turn word wrap off
set nowrap
"set wrap

" Enable folding with the spacebar
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" No backup files
set nobackup
set nowritebackup
set noswapfile

" synchronise default and cliboard registers
" doesn't work without clipboard support
" see if vim comes with clipboard support:
" $ vim --version | grep clipboard
set clipboard^=unnamed

" Command history
set history=100

" Set line numbering
set number

" Switch syntax highlighting on, when the terminal has colors
syntax on

" Always show cursor
set ruler

" Ignore case in all-lowercase search, mind case in mixed-case search
set ignorecase
set smartcase

" Enable incremental search
set incsearch

" Allow backspace to delete end of line, start of line, and indent characters
set backspace=indent,eol,start

" UTF encoding
set encoding=utf-8

" Set tab size in spaces
set tabstop=4 shiftwidth=4 expandtab
set softtabstop=4    " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround      " round indent to multiple of 'shiftwidth'
set autoindent      " align the new line indent with the previous line
set fileformat=unix

" change tabsize depending on file type
autocmd FileType sml setlocal shiftwidth=3 tabstop=3 softtabstop=3
autocmd FileType ocaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType c setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript,html,xml,css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd FileType java setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt


" customize indentLine plugin variable definitions
"let g:indentLine_color_dark = 1
" disable indentLine
let g:indentLine_enabled = 0

" Highlight trailing whitespace
set list listchars=tab:\ \ ,trail:·


" Get rid of the delay when pressing O (for example)
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" Always show status bar
set laststatus=2
" Set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

" Autoload files that have changed outside of vim
set autoread

" Don't show intro
set shortmess+=I

" Better splits (new windows appear below and to the right)
set splitbelow
set splitright

" Highlight the current line
"set cursorline

" Disable Vim's conceal feature for latex to display full syntax
let g:tex_conceal = ""

"" Python stuff
" enable all Python syntax highlighting features
let python_highlight_all = 1

"" SML stuff
set sft
"set ignorecase
filetype indent on

source ~/.vim/matchit.vim

if has("gui_running")
    set background=dark
	colors darkblue
else
    colors zenburn
endif



" Always highlight column 76 so it's easier to see where
" cutoff appears on longer screens
" try ctermbg=darkred
autocmd BufWinEnter * highlight ColorColumn ctermbg=yellow
set colorcolumn=76
"set textwidth=0 " lines longer than 76 columns will be broken
"set textwidth=76 " lines longer than 76 columns will be broken
set wrapmargin=0

" do not break lines on SML and GRM files
" doesn't seem to work
"autocmd BufReadPre,BufNew,BufRead *.sml,*.grm setlocal textwidth=150

" Echo keystrokes on status line
set showcmd

" Plugin management via Vundle: set the runtime path and initialize
" (re)install all plugins from within vim with
" :PluginInstall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

Plugin 'sjl/tslime.vim'
let g:tslime_ensure_trailing_newlines=2

" syntax completion
Plugin 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <Leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" check syntax on each save
Plugin 'scrooloose/syntastic'

" Zenburn color scheme
Plugin 'jnurmine/Zenburn'

Plugin 'vim-scripts/indentpython.vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tpope/vim-repeat'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-commentary'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore .pyc files in NERDTree

Plugin 'losingkeys/vim-niji'

" all vim plugins must be added before the following line
call vundle#end()
filetype plugin indent on


" merlin setup
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"

" ocaml ocp-indent source code indenter
"set rtp^="$HOME/.opam/4.02.3/share/ocp-indent/vim
"autocmd FileType ocaml source substitute(system('opam config var share'), '\n$', '', '''') . "/typerex/ocp-indent/ocp-indent.vim"


" Keybindings
" Insert timestamp
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" map jj to ESC
inoremap jj <ESC>


" copy to buffer
vmap <C-c> :w !pbcopy<CR>
"vmap <C-c> :w! ~/.vimbuffer<CR>
"nmap <C-c> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-p> :r ~/.vimbuffer<CR>

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" execute Python via:
" \\
nnoremap <Leader><Leader> :exec '!python' shellescape(@%, 1)<CR>
