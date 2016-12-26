set nocompatible

" Turn word wrap off
set nowrap
"set wrap

" No backup files
set nobackup
set nowritebackup
set noswapfile

" synchronise default and cliboard registers
" doesn't work without clipboard support
" see if vim comes with clipboard support:
" $ vim --version | grep clipboard
set clipboard=unnamed

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

" change tabsize depending on file type
autocmd FileType sml setlocal shiftwidth=3 tabstop=3 softtabstop=3
autocmd FileType ocaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType c setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
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
	colors darkblue
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

" Plugin management via pathogen.vim
execute pathogen#infect()
filetype plugin indent on

" merlin setup
"let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"execute "set rtp+=" . g:opamshare . "/merlin/vim"

" ocaml ocp-indent source code indenter
"set rtp^="$HOME/.opam/4.02.3/share/ocp-indent/vim
"autocmd FileType ocaml source substitute(system('opam config var share'), '\n$', '', '''') . "/typerex/ocp-indent/ocp-indent.vim"


" ctrlp plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim

" tslime plugin
set runtimepath^=~/.vim/bundle/tslime.vim
let g:tslime_ensure_trailing_newlines=2


" Keybindings
" Insert timestamp
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>


" copy to buffer
vmap <C-c> :w !pbcopy<CR>
"vmap <C-c> :w! ~/.vimbuffer<CR>
"nmap <C-c> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-p> :r ~/.vimbuffer<CR>
