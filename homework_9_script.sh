#!/bin/sh

#SBATCH --job-name=FastQC # Job name
#SBATCH --cpus-per-task=1 # Run on a single CPU
#SBATCH --mem=1gb # Job memory request
#SBATCH --time=01:00:00 # Time limit hrs:min:sec
#SBATCH --output=JobName.%j.log # Standard output and error log
#SBATCH --partition=short # Task priority
#SBATCH --constraint=compute # Node type

for filename in ./*.fastq.gz:
       fastqc filename -o .

multiqc .       
