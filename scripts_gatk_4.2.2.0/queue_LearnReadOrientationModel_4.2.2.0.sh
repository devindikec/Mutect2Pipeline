#!/bin/bash
#SBATCH --job-name=qRead
#SBATCH -c 1
#SBATCH --mem=8g
#SBATCH -t 1-00:00 # Runtime in D-HH:MM

module load gatk/4.2.2.0

for normal in `cat ../recalibrated_normal.tsv | cut -f4`; do
name=${normal%XN}
sbatch LearnReadOrientationModel_4.2.2.0.sh ${name}

done

