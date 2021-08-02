#!/bin/sh
#COBALT -n 1 -t 5 -A Catalyst -q debug-cache-quad

aprun -n 16 -N 16 -cc depth -d 4 -j 1 -e OMP_NUM_THREADS=4 ./hello_affinity
