#!/bin/bash
#SBATCH --job-name=Mutect2
#SBATCH -c 1
#SBATCH --mem=32g
#SBATCH -t 1-00:00 # Runtime in D-HH:MM

module load gatk/4.2.2.0
tumor=${1}
normal=${2}
mkdir ../results/gatk_4.2.2.0/${tumor}_vs_${normal}

gatk Mutect2 \
-R /bgfs/genomics/refs/igenomes/Homo_sapiens/GATK/GRCh38/Sequence/WholeGenomeFasta/Homo_sapiens_assembly38.fasta \
-I ../results/Preprocessing/${tumor}/Recalibrated/${tumor}.recal.bam \
-I ../results/Preprocessing/${normal}/Recalibrated/${normal}.recal.bam \
-tumor ${tumor} \
-normal ${normal} \
--germline-resource ../somatic-hg38_small_exac_common_3.hg38.vcf \
--disable-read-filter MateOnSameContigOrNoMappedMateReadFilter \
-L ../xgen-exome-research-panel-v2-targets-hg38.bed \
-O ../results/gatk_4.2.2.0/${tumor}_vs_${normal}/somatic_${tumor}_vs_${normal}.vcf.gz \
-bamout ../results/gatk_4.2.2.0/${tumor}_vs_${normal}/somatic_${tumor}_vs_${normal}.bam \
--f1r2-tar-gz ../results/gatk_4.2.2.0/${tumor}_vs_${normal}/f1r2_${tumor}_vs_${normal}.tar.gz
