#!/bin/bash
#
#SBATCH --job-name=FilterMutectCall
#SBATCH -c 1
#SBATCH --mem=16g
#SBATCH -t 1-00:00 # Runtime in D-HH:MM

module load gatk/4.2.2.0
cd ..
gatk FilterMutectCalls -V results/gatk_4.2.2.0/${1}PT_vs_${1}XN/somatic_${1}PT_vs_${1}XN.vcf.gz -R /bgfs/genomics/refs/igenomes/Homo_sapiens/GATK/GRCh38/Sequence/WholeGenomeFasta/Homo_sapiens_assembly38.fasta --contamination-table results/gatk_processing_4.2.2.0/contamination/${1}.table --orientation-bias-artifact-priors /ix/hosmanbeyoglu/DATA/sarek/results/gatk_4.2.2.0/${1}PT_vs_${1}XN/${1}PT_vs_${1}XN_artifact-prior.tar.gz -O results/gatk_4.2.2.0/${1}PT_vs_${1}XN/filtered_${1}PT_vs_${1}XN.vcf.gz
