#!/bin/sh

#SBATCH --job-name=trimming # Job name
#SBATCH --cpus-per-task=2 # Run on a single CPU
#SBATCH --mem=5gb # Job memory request
#SBATCH --time 02:00:00 # Time limit hrs:min:sec
#SBATCH --output=JobName.%j.log # Standard output and error log
#SBATCH --error=JobName.%j.err
#SBATCH --partition=medium # Task priority
#SBATCH --constraint=compute # Node type

trimmomatic PE -phred33 illumina_reads_R1_001.fastq illumina_reads_R2_001.fastq illumina_reads_R1_paired.fastq illumina_reads_R1_unpaired.fastq illumina_reads_R2_paired.fastq illumina_reads_R2_unpaired.fastq ILLUMINACLIP:adapters.fa:2:30:10 LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 MINLEN:36
