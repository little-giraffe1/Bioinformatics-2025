#!/bin/sh

#SBATCH --job-name=wgs_fastqc  	# Job name
#SBATCH --cpus-per-task=40     	# Run on a single CPU
#SBATCH --mem=256gb             	# Job memory request
#SBATCH --time=1:30:00       	# Time limit hrs:min:sec
#SBATCH --output=/home/aprokofeva/tutorials/genomics/fastqc/fastqc_slurm.log  # Standard output and error log
#SBATCH --partition=short

cd ~/tutorials/genomics/fastqc;
ls ~/tutorials/genomics/raw/*.gz | parallel -j4 "fastqc -t 10 -o . {}"
