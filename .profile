# Source global definition
if [ -f /etc/profile ]; then
  . /etc/profile
fi
export TEST=".profile:$TEST"

export VISUAL=vim
export EDITOR="$VISUAL"

export R_HISTFILE=~/.Rhistory                                                                                                    
                                                                                                                                 
export PATH=$HOME/B260/software/scripts:$PATH

export PATH=$HOME/.local/bin:$PATH                                                                                      

export PATH=$HOME/software/MEGAHIT-1.2.9-Linux-x86_64-static/bin:$PATH 
export PATH=$HOME/B260/software/users/gleixner/tommyau-bamclipper-8628779:$PATH
export PATH=$HOME/software/bbmap:$PATH
export PATH=$HOME/software/bin:$PATH
export PATH=$HOME/local/bin:$PATH
export JAVA_FLAGS+=" -Djava.net.useSystemProxies=true"
export JAVA_TOOL_OPTIONS+=" -Djava.net.useSystemProxies=true"
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
export MANPATH=$HOME/local/share/man:$MANPATH

export PERL5LIB="/home/gleixner/perl5/lib/perl5:$PERL5LIB"

MODULEPATH=${MODULEPATH}:$HOME/B260/software/modules/packages
MODULEPATH=${MODULEPATH}:$HOME/B260/software/modules/meta_modules
MODULEPATH=${MODULEPATH}:~/software/modules/packages
MODULEPATH=${MODULEPATH}:~/software/modules/meta_modules
export MODULEPATH

module load search_modules/0.1
#module load libpng/1.6.37
#module load gcc/7.2.0                                                                                                          
#module load gcc/10.2.0                                                                                                          
module load gdal/3.5.1
module load git/2.26.0
module load gcc/11.1.0
module load jags/4.3.0
module load hdf5/1.8.18                                                                                                        
module load bwa-mem2/2.2.1
module load samtools/1.9
#module load python/3.7.0  # use newer python on Rstudio server for use with reticulate (e.g. to use tensorflow) 
#module load jags/4.3.0-gcc-10.2.0 # for inferCNV
module load imagemagick/7.1.0-gcc-11.1.0 # for ggforce & R's imagemagick package
##module load freetype/2.10.4-gcc-10.2.0 # for ragg & systemfonts
#export USE_SYSTEM_LIBGIT2=1 # for R package gert

if ps -e | grep -q rserver; then                                                                                                 
  # code below is from experiment trying to use conda on rstudio server. DONT DO THIS.
  #conda activate myR                                                                                                            
  #py36                                                                                                                          
  #conda activate forrss                                                                                                         
  #env > env.txt                                                                                                                 
  #if test $CONDA_PREFIX; then                                                                                                   
  R_VERSION=${R_HOME##*/r/}                                                                                                   
  R_VERSION=${R_VERSION%/lib64/R}
  MC_CORES=1
else
  module load pandoc/2.2.1 # to generate pdfs in R/python (equivalent loaded on Rstudio server anyways)
  R_VERSION=4.1.0
  MC_CORES=4
fi
module load R/$R_VERSION
export R_LIBS_USER=~/R/x86_64-pc-linux-gnu-library/${R_VERSION}d
export R_HOME=$(realpath $(dirname `which R`)/../lib64/R)  

# no longer needed since: conda config --set auto_activate_base false
## don't load conda on start up as it might slow down log in  or interfer with R                                             
## you will have to type load_conda once per session to be able to use conda commands                                                                                    

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


