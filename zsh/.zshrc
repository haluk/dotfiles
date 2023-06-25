#!/usr/bin/env bash
source $HOME/.bash_aliases

export PATH=$HOME/.local/bin:$HOME/Applications/texlive/2023/bin/x86_64-linux:$PATH

export EDITOR="emacs"


export LESS="-i -J -M -R -W -x4 -z-4"
export LESSCOLORIZER='pygmentize -O style=monokai'
LESSOPEN="|$HOME/.local/bin/lesspipe.sh %s"; export LESSOPEN

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

#
# Oh-my-zsh
#

export ZSH="$HOME/.oh-my-zsh"

SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true # Show prefix before first line in prompt
export VIRTUAL_ENV_DISABLE_PROMPT=true

ZSH_THEME="spaceship" # Set theme
plugins=(
  # colored-man-pages
  docker
  docker-compose
  extract
  git # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git
  history-substring-search # ZSH port of Fish history search. Begin typing command, use up arrow to select previous use
  ssh-agent
  pass
  pyenv
  # zsh-autosuggestions # Suggests commands based on your history
  zsh-completions # More completions
  zsh-syntax-highlighting # Fish shell like syntax highlighting for Zsh
  zsh-fzf-history-search
)
autoload -U compinit && compinit # reload completions for zsh-completions

source $ZSH/oh-my-zsh.sh # required

# Colorize autosuggest
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

#
# Spaceship-prompt
#

SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  user          # Username section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  time          # Time stamps section
  hg            # Mercurial section (hg_branch  + hg_status)
  # package       # Package version
  # node          # Node.js section
  # bun           # Bun section
  # deno          # Deno section
  # ruby          # Ruby section
  python        # Python section
  # elm           # Elm section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  golang        # Go section
  # php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  java          # Java section
  lua           # Lua section
  # dart          # Dart section
  # julia         # Julia section
  # crystal       # Crystal section
  docker        # Docker section
  # aws           # Amazon Web Services section
  # gcloud        # Google Cloud Platform section
  venv          # virtualenv section
  # conda         # conda virtualenv section
  # dotnet        # .NET section
  # kubectl       # Kubectl context section
  # terraform     # Terraform workspace section
  # ibmcloud      # IBM Cloud section
  exec_time     # Execution time
  # async         # Async jobs indicator
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
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

## LSCOLORS
export LS_COLORS="$(vivid generate one-dark)"
zstyle ':completion:*:default' list-colors "$LS_COLORS"

## TERMCAP colors
# [[ -f ~/.LESS_TERMCAP ]] && . $HOME/.LESS_TERMCAP

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export WORKON_HOME="~/.pyenv/versions"
# virtualenvwrapper
# source $HOME/.pyenv/versions/3.10.0/bin/virtualenvwrapper.sh

# Docker
export DOCKER_USER="$(id -u):$(id -g)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/hd/.sdkman"
[[ -s "/home/hd/.sdkman/bin/sdkman-init.sh" ]] && source "/home/hd/.sdkman/bin/sdkman-init.sh"

