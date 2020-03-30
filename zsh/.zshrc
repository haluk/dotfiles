# If you come from bash you might have to change your $PATH. export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/hd/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	autojump
	bgnotify
	colored-man-pages
	command-not-found	
	copyfile
	dircycle
	docker
	encode64
	extract
	fzf
	git
	github
	gpg-agent
	history
	jsontools
	navi
	pass
	per-directory-history
	pip
	ssh-agent
	wd
	web-search
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Spaceship theme configuration
SPACESHIP_TIME_SHOW=true
SPACESHIP_CHAR_SYMBOL="λ "
SPACESHIP_USER_SHOW=always
SPACESHIP_HOST_SHOW=always

source $HOME/.bash_aliases

# Functions
dotp() {
    dot -Tpng $1.dot -o $1.png; xviewer $1.png
}
jjar() {
    java -jar $1.jar "${@:2}"
}
fzfp() {
    fzf --preview="bat --style=numbers --color=always {}"
}
convertpdf() {
    pdftoppm -jpeg $1 $2
    convert $2-*.jpg $2.pdf
}

function prettycsv {
    local arg sep
    sep=","
    while getopts 's:' arg
    do
        case ${arg} in
            s) sep=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    shift $((OPTIND -1))
    column -t -s$sep -n "$@" | less -N -F -S -X -K
}

function listcols {
    local arg sep
    sep=","
    while getopts 's:' arg
    do
        case ${arg} in
            s) sep=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    shift $((OPTIND -1))
    awk -F$sep '{for (i = 1; i <= NF; i++) print i":", $i; exit}' $@
}

function apt-history() {
    case "$1" in
      install)
            cat /var/log/dpkg.log | grep 'install '
            ;;
      upgrade|remove)
            cat /var/log/dpkg.log | grep $1
            ;;
      rollback)
            cat /var/log/dpkg.log | grep upgrade | \
                grep "$2" -A10000000 | \
                grep "$3" -B10000000 | \
                awk '{print $4"="$5}'
            ;;
      *)
            cat /var/log/dpkg.log
            ;;
    esac
}

# LESSPIPE
# Set the Less input preprocessor.
if type lesspipe.sh >/dev/null 2>&1; then
  export LESSOPEN='|lesspipe.sh %s'
fi

if type pygmentize >/dev/null 2>&1; then
  export LESSCOLORIZER='pygmentize'
fi

# Path
export MANPATH=/home/hd/Applications/texlive/2019/texmf-dist/doc/man:$MANPATH
export INFOPATH=/home/hd/Applications/texlive/2019/texmf-dist/doc/info:$INFOPATH
export PATH=/home/hd/Applications/texlive/2019/bin/x86_64-linux:$PATH
export PATH=$PATH:"$ZSH_CUSTOM/plugins/navi"

# Python
## pyenv
export PATH="/home/hd/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
## pipenv
#eval "$(pipenv --completion)"

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Nodejs
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/hd/.sdkman"
[[ -s "/home/hd/.sdkman/bin/sdkman-init.sh" ]] && source "/home/hd/.sdkman/bin/sdkman-init.sh"
