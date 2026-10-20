#!/bin/bash


#SBATCH -t 0-02:00
#SBATCH --mem-per-cpu=0
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --account=def-salahub

export DEMON_SHARED_DIR="/home/sankh/projects/rrg-salahub-ad/sankh/reparm"
export DEMON_EXEC="/home/sankh/projects/rrg-salahub-ad/sankh/reparm/deMon.0.08.mpi"
export AUXIS="$DEMON_SHARED_DIR/AUXIS"
export BASIS="$DEMON_SHARED_DIR/BASIS"
export ECPS="$DEMON_SHARED_DIR/ECPS"

cp $BASIS .
cp $AUXIS .
cp $ECPS .
here=${PWD}
cd $here
echo "Current working directory is `pwd`"
echo "---------------------"
cat $SLURM_NODELIST
echo "---------------------"

CORES=1
echo "Running on $CORES cores."
echo "Starting run at: `date`"

mpiexec -np $CORES $DEMON_EXEC deMon.inp > deMon.out

mv deMon.inp inp
mv deMon.out out
rm deMon.*
mv inp deMon.inp
mv out deMon.out

echo "Program deMon finished with exit code $? at: `date`"
