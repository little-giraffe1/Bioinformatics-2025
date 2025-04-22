#!/bin/sh

#SBATCH --job-name=FastQC # Job name
#SBATCH --cpus-per-task=2 # Run on a single CPU
#SBATCH --mem=5gb # Job memory request
#SBATCH --time 02:00:00 # Time limit hrs:min:sec
#SBATCH --output=JobName.%j.log # Standard output and error log
#SBATCH --error=JobName.%j.err
#SBATCH --partition=medium # Task priority
#SBATCH --constraint=compute # Node type

for filename in ./*.fastq.gz; do
	       fastqc filename -o . 
       done
	       
multiqc . --filename homework_9_multiqc.html
