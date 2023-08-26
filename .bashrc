# Source global definitions
#if [ -f /etc/bashrc ]; then
#    . /etc/bashrc
#fi

export TEST="bashrc:$TEST"

alias refresh='env -i HOME="$HOME" "$SHELL" -l'
alias int='bsub -R "rusage[mem=10G]" -Is $SHELL --login'
alias ll='ls -alvh --color=always'

alias dotfiles-git='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

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

