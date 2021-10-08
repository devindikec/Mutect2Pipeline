#!/bin/bash
#
#SBATCH --job-name=LearnRead
#SBATCH -c 1
#SBATCH --mem=16g
#SBATCH -t 1-00:00 # Runtime in D-HH:MM

cd ..
module load gatk/4.2.2.0
gatk LearnReadOrientationModel \
-I results/gatk_4.2.2.0/${1}PT_vs_${1}XN/f1r2_${1}PT_vs_${1}XN.tar.gz \
-O results/gatk_4.2.2.0/${1}PT_vs_${1}XN/${1}PT_vs_${1}XN_artifact-prior.tar.gz
