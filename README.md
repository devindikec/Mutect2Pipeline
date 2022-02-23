# Mutect2Pipeline
Calling somatic mutations through Mutect2 in the GATK 4.2.2.0 package

This code processes whole exome bam files for tumor and normal data into maf files to classify variants through six steps

1. Mutect2
2. GetPileupSummaries
3. CalcContaminate
4. LearnReadOrientationModel
5. FilterMutectCalls
6. Funcotator

Visual provided for guidance with brief descriptions below  

Somatic Point Mutation Detection and Annotation Pathway
![image](https://user-images.githubusercontent.com/56173874/137376500-f1a8d68b-1eb1-4ea7-95e0-2f1c0cda9cc3.png)
Image provided at https://redmine.igm.cumc.columbia.edu/projects/poi/wiki/Outline_of_Somatic_Discovery_Pipeline

1. Mutect2-
The code requires whole exome bam files of tumor and normal sample data along with a reference fasta file. Output includes a vcf, bam, and f1r2 count file.

2. GetPileupSummaries-
Using the input bam file calculates the pileup metrics for contamination knowledge. Output is a pileup table used in the next step.

3. CalcContaminate-
The previous pileup table for tumor and normal are used to calculate contamination data. Output is a contamination table used for filtering in step 5.

4. LearnReadOrientationModel-
The f1r2 counts generated in Mutect2 are used to determine artifact priors for additional filtering. 

5. FilterMutectCalls-
The output from Mutect2, CalcContaminate, and LearnReadOrientationModel are combined to filter the mutation data and generate analysis ready variants. 

6. Funcotator- 
Filtered vcf data from FilterMutectCalls is functionally annotated to generate a final MAF output file. 

All queue files are used to run these stages for multiple individuals at once in smaller jobs. Additional details for these functions can be found within GATK at https://gatk.broadinstitute.org/hc/en-us
