# Mutect2Pipeline
Calling somatic mutations through Mutect2 in the GATK 4.2.2.0 package

This code processes whole exome bam files for tumor and normal data into maf files to classify variants through six steps

1. Mutect2
2. GetPileupSummaries
3. CalcContaminate
4. LearnReadOrientationModel
5. FilterMutectCalls
6. Funcotator

Descriptions for each step of the code will be provided below along with a visual for guidance 

![image](https://user-images.githubusercontent.com/56173874/137376500-f1a8d68b-1eb1-4ea7-95e0-2f1c0cda9cc3.png)
