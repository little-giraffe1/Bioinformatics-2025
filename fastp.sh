#!/bin/sh

#BATCH --job-name=fastp_wgs  	# Job name
#SBATCH --cpus-per-task=40     	# Run on a single CPU
#SBATCH --mem=256gb             	# Job memory request
#SBATCH --time=1:55:00       	# Time limit hrs:min:sec
#SBATCH --output=/home/aprokofeva/tutorials/genomics/trimmed/fastp_slurm.log  # Standard output and error log
#SBATCH --partition=short

cd ~/tutorials/genomics/trimmed;
ls ~/tutorials/genomics/raw/*1.fq.gz | parallel -j2 "fastp -w 20 -i {} -I {=s:_1.fq.gz:_2.fq.gz:=} -o {=s:.*/::=} -O {=s:.*/::;s:_1.fq.gz:_2.fq.gz:=} --unpaired1 {=s:.*/::;s:_1.fq.gz:_U.fq.gz:=} --unpaired2 {=s:.*/::;s:_1.fq.gz:_U.fq.gz:=} -x -5 -r -f 15 -M 25"

