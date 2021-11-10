#!/bin/bash -x

### Map reads to GRCm38 using STARsolo. 

### Set up 

CPU=8
INDEX=/Volumes/TIGERII/nobackup/refseq/starindex/
READS=/Users/ctl/github/scBRIE2/data/
MANIFEST=/Users/ctl/github/scBRIE2/data/manifest.tsv
SAMPLES=/Users/ctl/github/scBRIE2/data/sample_list.txt

### Run mapping 

for i in $(awk '{ print $3}' $MANIFEST)

do

    mkdir $i

    cd $i 

    STAR --runThreadN $CPU --genomeDir $INDEX --readFilesIn $READS/$i\_R1.fastq.gz $READS/$i\_R2.fastq.gz --soloType SmartSeq --readFilesManifest $MANIFEST --soloUMIdedup Exact --soloStrand Unstranded --outSAMtype BAM SortedByCoordinate --outFileNamePrefix $i

    cd ..

done
