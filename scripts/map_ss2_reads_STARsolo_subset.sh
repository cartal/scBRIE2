#!/bin/bash -x

### Map reads to GRCm38 using STARsolo. 

### Set up 

CPU=3
INDEX=/Volumes/pinquisitor/experiments/data/ref_seq/ct5_index/refseq/starindex
READS=/Volumes/pinquisitor/experiments/data/mouse/liver/snRNAseq2_subset/fastq
MANIFEST=/Volumes/pinquisitor/experiments/data/mouse/liver/snRNAseq2_subset/manifest_subset.tsv
OUT=/Volumes/pinquisitor/experiments/data/mouse/liver/snRNAseq2_subset/mapped

### Run mapping 

for i in $(awk '{ print $3}' $MANIFEST)

do

    mkdir $i

    cd $i 

    PE1=$i\_R1.fastq.gz
    PE2=$i\_R2.fastq.gz

    cp $READS/$PE1 $PE1 
    cp $READS/$PE2 $PE2

    STAR --runThreadN $CPU --genomeDir $INDEX --readFilesIn <(gunzip -c $PE1) <(gunzip -c $PE2) --soloType SmartSeq --soloUMIdedup Exact --soloStrand Unstranded --outSAMtype BAM SortedByCoordinate --outFileNamePrefix $i
    
    rm $PE1 $PE2 

    cd ..

    mv $i $OUT

done
