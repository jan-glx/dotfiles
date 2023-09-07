# Source global definitions
#if [ -f /etc/bashrc ]; then
#    . /etc/bashrc
#fi

export TEST="bashrc("$(date --iso="second")"):$TEST"

alias refresh='env -i HOME="$HOME" "$SHELL" -l'
alias int='bsub -R "rusage[mem=10G]" -Is $SHELL --login'
alias ll='ls -alvh --color=always'

alias dotfiles-git='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

HISTSIZE=100000                   # big big history
HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
#PROMPT_COMMAND="history -a ; history -n ; $PROMPT_COMMAND" # write an reload history on every command


# delete previous sessions's per session history imideatly to shared history, keep per session history, relaod shared history and append per session history after each command
rm -f ${HISTFILE}.$$
trap "rm -f ${HISTFILE}.$$ ${HISTFILE}.$$.last ; unset HISTFILE" EXIT


PS1="\[\033[01;33m\h:${LSB_JOBID}:\w\033[00m\n\$ "                                                                                     

## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/software/anaconda3/2021.05/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/software/anaconda3/2021.05/etc/profile.d/conda.sh" ]; then
#        . "/software/anaconda3/2021.05/etc/profile.d/conda.sh"
#    else
#        export PATH="/software/anaconda3/2021.05/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda initialize <<<

