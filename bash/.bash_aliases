alias vim="nvim"

alias weather="curl 'wttr.in/?m'"
alias align="column -t -s $'\t'"
alias copy="xclip -sel clipboard"

alias crane="ssh -A hdogan@crane.unl.edu"
alias rhino="ssh -A hdogan@rhino.unl.edu"
alias panda="ssh -A haluk@sbbi-panda.unl.edu"
alias falcon="ssh -At haluk@sbbi-falcon.unl.edu zsh"
alias cse="ssh -A hdogan@cse.unl.edu"

alias up="nmcli conn up prorize"
alias down="nmcli conn down prorize"
alias dc="docker-compose"
alias pandock='docker run --rm -v "$(pwd):/data" -u $(id -u):$(id -g) pandoc/latex'
alias plantuml='java  -jar /home/hd/.config/emacs/.local/etc/plantuml.jar'
