# Source global definition
[[ -r ~/.profile ]] && . ~/.profile
if [ -n "$BASH_VERSION" -a -n "$PS1" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

export TEST=".bash_profile("$(date --iso="second")"):$TEST"

                                                                                                                                 
HISTSIZE=100000                   # big big history                                                                       
HISTFILESIZE=100000               # big big history                                                                       
shopt -s histappend                      # append to history, don't overwrite it                                                 

#PROMPT_COMMAND="history -a ; history -n ; $PROMPT_COMMAND" # write an reload history on every command
PROMPT_COMMAND='rm -f ${HISTFILE}.$$.last ; touch ${HISTFILE}.$$.last && history -a ${HISTFILE}.$$.last && cat ${HISTFILE}.$$.last | tee -a ${HISTFILE} >> ${HISTFILE}.$$  ; history -c ; history -r ${HISTFILE} ; history -r ${HISTFILE}.$$ ; '"$PROMPT_COMMAND"


prepare_tapestri () {
  module remove samtools/1.9 bwa-mem2/2.2.1 hdf5/1.8.18
  . ~/software/tapestri_v2.0.2/load_tapestri_conda.sh 
  export PYTHONNOUSERSITE=1 
}

# no longer needed since: conda config --set auto_activate_base false
## don't load conda on start up as it might slow down log in  or interfer with R                                             
## you will have to type load_conda once per session to be able to use conda commands                                                                                    
load_conda () {
  module remove python/3.7.0 # this python is incopatible with the conda module an therefore only loaded on the rstudio server    
  module load anaconda3/2021.05
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/software/anaconda3/2021.05/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/software/anaconda3/2021.05/etc/profile.d/conda.sh" ]; then
          . "/software/anaconda3/2021.05/etc/profile.d/conda.sh"
      else
          export PATH="/software/anaconda3/2021.05/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<
}

if [[ $JUPYTERHUB_CLIENT_ID ]] ; then
  export PYTHONUSERBASE="~/jupyterhub_base"
  load_conda
  conda activate notebook_env #nb_conda_kernels
fi   

source ~/software/git-completion.bash

