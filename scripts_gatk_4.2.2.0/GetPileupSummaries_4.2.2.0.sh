#!/bin/bash
#
#SBATCH --job-name=GetPileS
#SBATCH -c 1
#SBATCH --mem=32g
#SBATCH -t 1-00:00 # Runtime in D-HH:MM

module load gatk/4.2.2.0

cd $1

gatk GetPileupSummaries \
        -I ./results/Preprocessing/${2}/Recalibrated/${2}.recal.bam	  \
        -V somatic-hg38_small_exac_common_3.hg38.vcf    \
        -L somatic-hg38_small_exac_common_3.hg38.vcf    \
        -O results/gatk_processing_4.2.2.0/${2}.table

