#!/bin/bash
#COBALT -n 1 -t 30 -q debug-cache-quad -A Catalyst

cd /projects/catalyst/knight/tests/singularity 

CONTAINER=Singularity.mpich33

# Use Cray's Application Binary Independent MPI build
module swap cray-mpich cray-mpich-abi

# include CRAY_LD_LIBRARY_PATH in to the system library path
# in order to pass environment variables to a Singularity container create the variable
# with the SINGULARITYENV_ prefix
export SINGULARITYENV_LD_LIBRARY_PATH=/opt/cray/wlm_detect/default/lib64/:$CRAY_LD_LIBRARY_PATH:$LD_LIBRARY_PATH

# print to log file for debug
echo $SINGULARITYENV_LD_LIBRARY_PATH

RANKS_PER_NODE=4
THREADS_PER_RANK=1
DEPTH_PER_RANK=1
THREADS_PER_CORE=1
TOTAL_RANKS=$(( $COBALT_JOBSIZE * $RANKS_PER_NODE ))

# this simply runs the command 'ldd /myapp/pi' inside the container and should show that
# the app is running agains the host machines Cray libmpi.so not the one inside the container
# run my contianer like an application, which will run '/myapp/pi'
aprun -n $TOTAL_RANKS -N $RANKS_PER_NODE --cc depth -d ${DEPTH_PER_RANK} -j ${THREADS_PER_CORE} -e OMP_NUM_THREADS=${THREADS_PER_RANK} singularity run -B /opt -B /etc/alternatives $CONTAINER


