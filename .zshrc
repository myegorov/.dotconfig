# Path to your oh-my-zsh installation.
# export ZSH=/home/max/.oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
bindkey -v
export KEYTIMEOUT=1



# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="minimal"
#ZSH_THEME="avit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="$HOME/bin:$HOME/scripts:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
export PATH=${HOME}/.cabal/bin:${PATH}
export PATH=$PATH:/opt/Qt/Tools/QtCreator/bin:/opt/Qt/5.5/gcc_64/bin
export PATH=/usr/local/texlive/2015/bin/x86_64-linux:$PATH
export INFOPATH=/usr/local/texlive/2015/texmf-dist/doc/info:$INFOPATH
export MANPATH=/usr/local/texlive/2015/texmf-dist/doc/man:$MANPATH
export TEXMFHOME=$HOME/texmf


 #export MANPATH="/usr/local/man:$MANPATH"
export CLASSPATH=$CLASSPATH:$HOME/java:$HOME/learndir/learn_java:$HOME/java/jama/Jama-1.0.3.jar
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ptpython="ptipython --vi"
#alias js="js24"
alias langfc="$HOME/classes/16_spring/compiler/git/project5/bin/langfc -Ckeep-convert-to-reploc=true -Ckeep-vm-codegen=true"

# keep track of dotfiles
alias dotconfig='/usr/bin/git --git-dir=$HOME/.dotconfig/ --work-tree=$HOME'

# Virtualenv wrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# force Python not to save *.pyc in __pycache__
# by setting PYTHONDONTWRITEBYTECODE to any value
export PYTHONDONTWRITEBYTECODE=true

# OCaml configuration for OPAM
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
eval `opam config env`

# Racket
alias racket='/Applications/Racket\ v6.7/bin/racket -i -p neil/sicp -l xrepl'
