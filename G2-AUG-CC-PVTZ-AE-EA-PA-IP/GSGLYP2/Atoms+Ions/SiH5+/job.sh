#!/bin/bash
#SBATCH -t 0-02:00
#SBATCH --mem-per-cpu=0
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --account=def-salahub

# Detect the top-level folder (0.08, 0.16, 0.25, 0.30) from current path
TOPDIR=$(echo "$PWD" | awk -F'/' '{for(i=1;i<=NF;i++) if($i ~ /0\.(08|16|25|30)/){print $i; exit}}')

# Set DEMON executable based on top-level folder
DEMON_EXEC="/home/sankh/projects/rrg-salahub-ad/sankh/reparm/deMon.${TOPDIR}.mpi"

export DEMON_SHARED_DIR="/home/sankh/projects/rrg-salahub-ad/sankh/reparm"
export AUXIS="$DEMON_SHARED_DIR/AUXIS"
export BASIS="$DEMON_SHARED_DIR/BASIS"
export ECPS="$DEMON_SHARED_DIR/ECPS"

# Copy required files to current folder
cp $BASIS .
cp $AUXIS .
cp $ECPS .

echo "Current working directory is `pwd`"
echo "---------------------"
cat $SLURM_NODELIST
echo "---------------------"

CORES=1
echo "Running on $CORES cores."
echo "Starting run at: `date`"

mpiexec -np $CORES $DEMON_EXEC deMon.inp > deMon.out

# Organize output
mv deMon.inp inp
mv deMon.out out
rm deMon.*
mv inp deMon.inp
mv out deMon.out

echo "Program deMon finished with exit code $? at: `date`"

