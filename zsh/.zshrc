#!/usr/bin/env bash
source $HOME/.bash_aliases

export PATH=$HOME/.local/bin:$PATH

export TERM="screen-256color"

export EDITOR="emacs"

export LESS="-i -J -M -R -W -x4 -z-4"
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_so=$'\E[30;48;05;19m' # begin reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# LESSPIPE
if type pygmentize >/dev/null 2>&1; then
  export LESSCOLORIZER='pygmentize'
fi
# Set the Less input preprocessor.
if type lesspipe.sh >/dev/null 2>&1; then
  export LESSOPEN='|lesspipe.sh %s'
fi

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\E[30;48;05;19m'
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

#
# Oh-my-zsh
#

export ZSH="$HOME/.oh-my-zsh"

SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true # Show prefix before first line in prompt
ZSH_THEME="spaceship" # Set theme

plugins=(
  docker-compose
  extract
  git # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git
  history-substring-search # ZSH port of Fish history search. Begin typing command, use up arrow to select previous use
  ssh-agent
  zsh-autosuggestions # Suggests commands based on your history
  zsh-completions # More completions
  zsh-syntax-highlighting # Fish shell like syntax highlighting for Zsh
)
autoload -U compinit && compinit # reload completions for zsh-completions

source $ZSH/oh-my-zsh.sh # required

# Colorize autosuggest
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

#
# Spaceship-prompt
#

# Spaceship-prompt customization
SPACESHIP_PROMPT_ORDER=(
dir             # Current directory section
user            # Username section
host            # Hostname section
git             # Git section (git_branch + git_status)
time            # Time stampts section
hg              # Mercurial section (hg_branch  + hg_status)
# package       # Package version
# node          # Node.js section
# ruby          # Ruby section
# elixir        # Elixir section
# xcode         # Xcode section
# swift         # Swift section
# golang        # Go section
# php           # PHP section
# rust          # Rust section
# haskell       # Haskell Stack section
# julia         # Julia section
# docker        # Docker section
# aws           # Amazon Web Services section
venv            # virtualenv section
# conda         # conda virtualenv section
# pyenv           # Pyenv section
# dotnet        # .NET section
# ember         # Ember.js section
# kubecontext   # Kubectl context section
exec_time       # Execution time
line_sep        # Line break
battery         # Battery level and status
vi_mode         # Vi-mode indicator
jobs            # Background jobs indicator
# exit_code     # Exit code section
char            # Prompt character
)

SPACESHIP_DIR_PREFIX="%{$fg[blue]%}┌─[%b "
SPACESHIP_DIR_SUFFIX="%{$fg[blue]%} ] "
SPACESHIP_CHAR_SYMBOL="%{$fg[blue]%}└─λ%b "

#
# Other
#

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

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

function cless () {
    pygmentize -f terminal "$1" | less -R
}

# LSCOLORS
export LS_COLORS="$(vivid generate one-dark)"
zstyle ':completion:*:default' list-colors "$LS_COLORS"

# Python
export PATH="/home/hd/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# export WORKON_HOME=$HOME/Envs
# export VIRTUALENVWRAPPER=$HOME/.local/pipx/venvs/virtualenvwrapper
# export VIRTUALENVWRAPPER_PYTHON=$VIRTUALENVWRAPPER/bin/python
# source $VIRTUALENVWRAPPER/bin/virtualenvwrapper.sh
# export PATH="$VIRTUALENVWRAPPER/bin:$PATH"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
