#!/bin/bash
#
#SBATCH --job-name=Funcotator
#SBATCH -c 1
#SBATCH --mem=16g
#SBATCH -t 1-00:00 # Runtime in D-HH:MM

cd ..
module load gatk/4.2.2.0
gatk Funcotator \
     --variant results/gatk_4.2.2.0/${1}PT_vs_${1}XN/filtered_${1}PT_vs_${1}XN.vcf.gz \
     --reference /bgfs/genomics/refs/igenomes/Homo_sapiens/GATK/GRCh38/Sequence/WholeGenomeFasta/Homo_sapiens_assembly38.fasta \
     --ref-version hg38 \
     --data-sources-path funcotator_dataSources.v1.7.20200521s \
     --annotation-default Tumor_Sample_Barcode:${1}PT \
     --annotation-default Matched_Norm_Sample_Barcode:${1}XN \
     --output results/gatk_4.2.2.0/${1}PT_vs_${1}XN/variants_${1}_labeled.funcotated.maf \
     --output-file-format MAF

