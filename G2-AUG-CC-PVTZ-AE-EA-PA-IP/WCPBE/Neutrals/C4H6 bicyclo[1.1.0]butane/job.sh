#!/bin/bash


#SBATCH -t 0-01:00
#SBATCH --mem-per-cpu=1900
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
#SBATCH --account=def-salahub

export DEMON_SHARED_DIR="/home/amroshi/demon"
export DEMON_EXEC="$DEMON_SHARED_DIR/deMon.6.2.8.mpi"
export AUXIS="$DEMON_SHARED_DIR/AUXIS"
export BASIS="$DEMON_SHARED_DIR/BASIS"
export D3CFS="$DEMON_SHARED_DIR/D3CFS"
export ECPS="$DEMON_SHARED_DIR/ECPS"
export FFDS="$DEMON_SHARED_DIR/FFDS"
export MCPS="$DEMON_SHARED_DIR/MCPS"

cp $BASIS .
cp $AUXIS .
cp $D3CFS .
cp $ECPS .
cp $FFDS .
cp $MCPS .
here=${PWD}
cd $here
echo "Current working directory is `pwd`"
echo "---------------------"
cat $SLURM_NODELIST
echo "---------------------"

CORES=48
echo "Running on $CORES cores."
echo "Starting run at: `date`"

mpiexec -np $CORES $DEMON_EXEC deMon.inp > deMon.out

echo "Program deMon finished with exit code $? at: `date`"
