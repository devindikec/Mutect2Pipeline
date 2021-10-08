#!/bin/bash
#SBATCH --job-name=qMutect2
#SBATCH -c 1
#SBATCH --mem=8g
#SBATCH -t 1-00:00 # Runtime in D-HH:MM

module load gatk/4.2.2.0

for normal in `cat ../recalibrated_normal.tsv | cut -f4`; do
tumor=${normal%XN}PT
sbatch Mutect2_4.2.2.0.sh ${tumor} ${normal}

done


