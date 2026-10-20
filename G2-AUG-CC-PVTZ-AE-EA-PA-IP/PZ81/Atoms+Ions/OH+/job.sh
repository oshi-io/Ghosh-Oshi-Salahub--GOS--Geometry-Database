#!/bin/bash
#SBATCH -t 0-02:00
#SBATCH --mem-per-cpu=0
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --account=def-salahub
#SBATCH --job-name=deMon_lgga

# ---- Configuration ----
# Single deMon executable for all LGGA functionals
DEMON_EXEC="/home/sankh/projects/rrg-salahub-ad/sankh/lgga/deMon.0.25.mpi"

# Shared resource directory
DEMON_SHARED_DIR="/home/sankh/projects/rrg-salahub-ad/sankh/lgga"

export AUXIS="$DEMON_SHARED_DIR/AUXIS"
export BASIS="$DEMON_SHARED_DIR/BASIS"
export ECPS="$DEMON_SHARED_DIR/ECPS"

# ---- Copy required files locally ----
cp "$AUXIS" .
cp "$BASIS" .
cp "$ECPS" .

echo "Working directory: $(pwd)"
echo "Running on node(s):"
cat "$SLURM_NODELIST"
echo "---------------------"

# ---- Run configuration ----
CORES=1
echo "Running deMon on $CORES core(s)"
echo "Start time: $(date)"

# ---- Execute deMon ----
mpiexec -np "$CORES" "$DEMON_EXEC" deMon.inp > deMon.out

# ---- Post-run organization ----
mv deMon.inp inp
mv deMon.out out

# Remove temporary files
rm -f deMon.* AUXIS BASIS ECPS slurm*

# Restore names for easy re-runs or collection
mv inp deMon.inp
mv out deMon.out

echo "Program deMon finished with exit code $? at: $(date)"

