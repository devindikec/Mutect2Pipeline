#!/bin/bash
#SBATCH --job-name=qCalcContam
#SBATCH -c 1
#SBATCH --mem=32g
#SBATCH -t 1-00:00 # Runtime in D-HH:MM
module load gatk/4.2.2.0

mkdir /ix/hosmanbeyoglu/DATA/sarek/results/gatk_processing_4.2.2.0/tumor
mkdir /ix/hosmanbeyoglu/DATA/sarek/results/gatk_processing_4.2.2.0/normal
mkdir /ix/hosmanbeyoglu/DATA/sarek/results/gatk_processing_4.2.2.0/contamination
mv /ix/hosmanbeyoglu/DATA/sarek/results/gatk_processing_4.2.2.0/*PT.table /ix/hosmanbeyoglu/DATA/sarek/results/gatk_processing_4.2.2.0/tumor
mv /ix/hosmanbeyoglu/DATA/sarek/results/gatk_processing_4.2.2.0/*XN.table /ix/hosmanbeyoglu/DATA/sarek/results/gatk_processing_4.2.2.0/normal

START="/ix/hosmanbeyoglu/DATA/sarek/results/gatk_processing_4.2.2.0"
cd ${START}/tumor
for file in *.table; do
        NAME=${file%PT.table}
        sbatch /ix/hosmanbeyoglu/DATA/sarek/scripts_gatk_4.2.2.0/CalcContaminate_4.2.2.0.sh $START $NAME
done

