#!/bin/bash

#SBATCH --job-name=sig_dens_mem
#SBATCH --account=nn4654k
#SBATCH --partition=singlenode
#SBATCH --time=1-00:00:00
#SBATCH --mem-per-cpu=500M 
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --exclusive

## Set up job environment
#source /cluster/bin/jobsetup

# Set up node file for namd run :


#./occamcg
module load FFTW


bash comp_error.sh
exit 0







#######

