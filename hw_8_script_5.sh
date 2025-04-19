#!/bin/bash

awk -F'\t' 'BEGIN { OFS=FS } {chrom=$2; if (chrom == "X") chrom = 23; else if (chrom == "Y") chrom = 24; print chrom "\t" $0;}' ~/HW8/5/fin | sort -n -k1,1 -k3,3 -k4,4 | cut -f2- > ~/HW8/5/fout.txt
