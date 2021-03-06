#!/bin/bash -x

### Map reads to GRCm38 using STARsolo. 

### Set up

CPU=64
INDEX=/home/hpc/martinez/genomes/mm10/STARsolo/Gencode_M17_index/
READS=/home/hpc/martinez/00_projects/mouse/snRNAseq2_polyploidy_isoforms/snRNAseq2/
MANIFEST=/home/hpc/martinez/00_projects/mouse/snRNAseq2_polyploidy_isoforms/snRNAseq2/test_manifest.tsv
OUT=/home/hpc/martinez/00_projects/mouse/snRNAseq2_polyploidy_isoforms/star_mapped/

### Run mapping 

for i in $(awk '{ print $3}' $MANIFEST)

do

    mkdir $i

    cd $i 

    cp $READS/$i\_R1.fastq.gz pair_1.fastq.gz
    cp $READS/$i\_R2.fastq.gz pair_2.fastq.gz

    gunzip pair_1.fastq.gz 
    gunzip pair_2.fastq.gz

    STAR --runThreadN $CPU --genomeDir $INDEX --readFilesIn pair_1.fastq pair_2.fastq --soloType SmartSeq --readFilesManifest $MANIFEST --soloUMIdedup Exact --soloStrand Unstranded --outSAMtype BAM SortedByCoordinate --soloFeatures Gene GeneFull SJ --outFileNamePrefix $i\_
        
    rm *.fastq
    
    cd ..

    mv $i $OUT

done
