#!/bin/sh

#SBATCH --job-name=bwa_wgs     	# Job name
#SBATCH --cpus-per-task=40     	# Run on a single CPU
#SBATCH --mem=256gb            	# Job memory request
#SBATCH --time=1:55:00       	# Time limit hrs:min:sec
#SBATCH --output=/home/aprokofeva/tutorials/genomics/align/bwa_slurm.log  # Standard output and error log
#SBATCH --partition=short

cd ~/tutorials/genomics/align;
bwa mem /projects/mipt_dbmp_biotechnology/GRCh38/Homo_sapiens.GRCh38.dna.primary_assembly.fa ~/tutorials/genomics/trimmed/trimmed_2_paired.fq.gz ~/tutorials/genomics/trimmed/trimmed_3_paired.fq.gz | gzip -3 > aln_pe.sam.gz

