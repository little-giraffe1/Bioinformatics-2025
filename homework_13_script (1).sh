#!/bin/sh

#SBATCH --job-name=rna_seq     	# Job name
#SBATCH --cpus-per-task=40     	# Run on a single CPU
#SBATCH --mem=256gb            	# Job memory request
#SBATCH --time=4:00:00       	# Time limit hrs:min:sec
#SBATCH --output=/home/aprokofeva/homework/homework_13/hm_rna_seq/rna_seq_slurm.log  # Standard output and error log
#SBATCH --partition=medium

fastqc ~/homework/homework_13/hm_rna_seq/before_trimming/*.fastq.gz -o ~/homework/homework_13/hm_rna_seq/before_trimming
cd ~/homework/homework_13/hm_rna_seq/before_trimming
multiqc . -o ~/homework/homework_13/hm_rna_seq/before_trimming/multiqc_before_trimming

fastp -i Erik_mat_CD4_MiLab_S52_R1_001.fastq.gz -I Erik_mat_CD4_MiLab_S52_R2_001.fastq.gz -f 15 -t 10 -o ~/homework/homework_13/hm_rna_seq/after_trimming/Erik_mat_CD4_MiLab_S52_R1_001_trimmed.fastq -O ~/homework/homework_13/hm_rna_seq/after_trimming/Erik_mat_CD4_MiLab_S52_R2_001_trimmed.fastq

fastqc ~/homework/homework_13/hm_rna_seq/after_trimming/*.fastq -o ~/homework/homework_13/hm_rna_seq/after_trimming
cd ~/homework/homework_13/hm_rna_seq/after_trimming
multiqc . -o ~/homework/homework_13/hm_rna_seq/after_trimming/multiqc_after_trimming

STAR --runThreadN 40 --genomeDir /projects/mipt_dbmp_biotechnology/GRCh38/ --readFilesCommand zcat --readFilesIn ~/homework/homework_13/hm_rna_seq/before_trimming/Erik_mat_CD4_MiLab_S52_R1_001.fastq.gz ~/homework/homework_13/hm_rna_seq/before_trimming/Erik_mat_CD4_MiLab_S52_R2_001.fastq.gz --quantMode GeneCounts --outFileNamePrefix ~/homework/homework_13/hm_rna_seq/Erik_mat_CD4_MiLab_S52_

cd ~/homework/homework_13/hm_rna_seq
cat Erik_mat_CD4_MiLab_S52_Aligned.out.sam | samtools sort --threads 40 -o Erik_mat_CD4_MiLab_S52_sorted.sam -O sam

cd ~/homework/homework_13/hm_rna_seq
stringtie -o Erik_mat_CD4_MiLab_S52.gtf Erik_mat_CD4_MiLab_S52_sorted.sam