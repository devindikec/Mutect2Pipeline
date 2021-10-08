#!/bin/bash
#
#SBATCH --job-name=CalcContaminate
#SBATCH -c 1
#SBATCH --mem=16g
#SBATCH -t 1-00:00 # Runtime in D-HH:MM

module load gatk/4.2.2.0
cd $1
gatk CalculateContamination \
   -I tumor/${2}PT.table \
   -matched normal/${2}XN.table \
   -O contamination/${2}.table
