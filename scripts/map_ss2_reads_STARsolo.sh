#!/bin/bash -x

### Map reads to GRCm38 using STARsolo. 

### Set up 

CPU=24
INDEX=/Volumes/TIGERII/nobackup/refseq/starindex/
READS=/Users/ctl/github/scBRIE2/data
MANIFEST=/Users/ctl/github/scBRIE2/data/manifest.tsv

### Run mapping 

for i in $(awk '{ print $3}' $MANIFEST)

do

    mkdir $i

    cd $i 

    cp $READS/$i\_R1.fastq.gz pair_1.fastq.gz
    cp $READS/$i\_R2.fastq.gz pair_2.fastq.gz

    gunzip pair_1.fastq.gz 
    gunzip pair_2.fastq.gz

    STAR --runThreadN $CPU --genomeDir $INDEX --readFilesIn pair_1.fastq pair_2.fastq --soloType SmartSeq --readFilesManifest $MANIFEST --soloUMIdedup Exact --soloStrand Unstranded --outSAMtype BAM SortedByCoordinate --outFileNamePrefix $i

    rm *.fastq 

    cd ..

done
