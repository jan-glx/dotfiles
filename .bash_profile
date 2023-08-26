# Source global definition
if [ -f .profile ]; then
  . .profile
fi
[[ -r ~/.bashrc ]] && . ~/.bashrc
export TEST=".bashprofile:$TEST"

export PS1="\[\033[01;33m\h:${LSB_JOBID}:\w\033[00m\n\$ "                                                                                     
                                                                                                                                 
export HISTSIZE=100000                   # big big history                                                                       
export HISTFILESIZE=100000               # big big history                                                                       
shopt -s histappend                      # append to history, don't overwrite it                                                 
export POMPT_COMMAND='$PROMPT_COMMAND; history -a; history -n' # write an reload history on every command
prepare_tapestri () {
  module remove samtools/1.9 bwa-mem2/2.2.1 hdf5/1.8.18
  . ~/software/tapestri_v2.0.2/load_tapestri_conda.sh  
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

