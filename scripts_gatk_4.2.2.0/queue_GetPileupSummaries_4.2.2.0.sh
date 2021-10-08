#!/bin/bash
#
#SBATCH --job-name=GetPileS
#SBATCH -c 1
#SBATCH --mem=32g
#SBATCH -t 1-00:00 # Runtime in D-HH:MM
module load gatk/4.2.2.0

START="/ix/hosmanbeyoglu/DATA/sarek"

mkdir /ix/hosmanbeyoglu/DATA/sarek/results/gatk_processing_4.2.2.0
for file in `cat ${START}/recalibrated.tsv | cut -f4`; do
        sbatch ./GetPileupSummaries_4.2.2.0.sh $START $file
done
