#!/bin/bash -x

### Map reads to GRCm38 using STARsolo. 

### Set up 

CPU=8
INDEX=/home/hpc/martinez/genomes/mm10/STARsolo/Gencode_M17_index
READS=/home/hpc/martinez/00_projects/mouse/snRNAseq2_polyploidy_isoforms/snRNAseq2
MANIFEST=/home/hpc/martinez/00_projects/mouse/snRNAseq2_polyploidy_isoforms/snRNAseq2/manifest.tsv
SAMPLES=/home/hpc/martinez/00_projects/mouse/snRNAseq2_polyploidy_isoforms/snRNAseq2/sample_list.txt

### Run mapping 

for i in $(awk '{ print $3}' $MANIFEST)

do

    mkdir $i

    cd $i 

    STAR --runThreadN $CPU --genomeDir $INDEX --readFilesIn $READS/$i\_R1.fastq.gz $READS/$i\_R2.fastq.gz --soloType SmartSeq --readFilesManifest $MANIFEST --soloUMIdedup Exact --soloStrand Unstranded --outSAMtype BAM SortedByCoordinate --outFileNamePrefix $i

    cd ..

done
