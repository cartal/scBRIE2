#!/bin/bash -x

### Map reads to GRCm38 using STARsolo. 

### Set up 

CPU=4
INDEX=/Volumes/TIGERII/nobackup/refseq/starindex/
READS=/Volumes/pinquisitor/experiments/data/mouse/liver/snRNAseq2/fastq/
MANIFEST=/Volumes/pinquisitor/experiments/data/mouse/liver/snRNAseq2/manifest.tsv
MAPPED=/Volumes/pinquisitor/experiments/data/mouse/liver/mapped/

### Run mapping 

for i in $(awk '{ print $3}' $MANIFEST)

do

    mkdir $i

    cd $i 

    cp $READS/$i\_R1.fastq.gz pair_1.fastq.gz
    cp $READS/$i\_R2.fastq.gz pair_2.fastq.gz

    gunzip pair_1.fastq.gz 
    gunzip pair_2.fastq.gz

    grep "$i" $MANIFEST > sample_manifest.tsv

    STAR --runThreadN $CPU --genomeDir $INDEX --readFilesIn pair_1.fastq pair_2.fastq --soloType SmartSeq --readFilesManifest sample_manifest.tsv --soloUMIdedup Exact --soloStrand Unstranded --outSAMtype BAM SortedByCoordinate --outFileNamePrefix $i

    rm *.fastq 

    cd ..

    mv $i $MAPPED

done
