#!/bin/sh

#SBATCH --job-name=gatk     	# Job name
#SBATCH --cpus-per-task=40     	# Run on a single CPU
#SBATCH --mem=256gb            	# Job memory request
#SBATCH --time=1:55:00       	# Time limit hrs:min:sec
#SBATCH --output=/home/aprokofeva/tutorials/genomics/vcf/gatk_slurm.log  # Standard output and error log
#SBATCH --partition=short

cd ~/tutorials/genomics/vcf;
gatk HaplotypeCaller -I /home/mmyshkin/tutorials/genomics/sam/tagged.bam -R /projects/mipt_dbmp_biotechnology/GRCh38/Homo_sapiens.GRCh38.dna.primary_assembly.fa -O variants.vcf

