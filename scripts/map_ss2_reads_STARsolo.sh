#!/bin/bash -x

### Map reads to GRCm38 using STARsolo. 

### Set up 

<<<<<<< HEAD
CPU=3
INDEX=/Volumes/TIGERII/nobackup/refseq/starindex/
READS=/Users/ctl/github/scBRIE2/data/
MANIFEST=/Users/ctl/github/scBRIE2/data/manifest.tsv
SAMPLES=/Users/ctl/github/scBRIE2/data/sample_list.txt
=======
CPU=8
INDEX=/home/hpc/martinez/genomes/mm10/STARsolo/Gencode_M17_index
READS=/home/hpc/martinez/00_projects/mouse/snRNAseq2_polyploidy_isoforms/snRNAseq2
MANIFEST=/home/hpc/martinez/00_projects/mouse/snRNAseq2_polyploidy_isoforms/snRNAseq2/manifest.tsv
SAMPLES=/home/hpc/martinez/00_projects/mouse/snRNAseq2_polyploidy_isoforms/snRNAseq2/sample_list.txt
>>>>>>> 9a3b575dfb146db6a93de4ab381d080757b3bd7a

### Run mapping 

for i in $(awk '{ print $3}' $MANIFEST)

do

    mkdir $i

    cd $i 

    cp $READS/$i\_R1.fastq.gz ./
    cp $READS/$i\_R2.fastq.gz ./

    gunzip $i\_R1.fastq.gz $i\_R2.fastq.gz

    STAR --runThreadN $CPU --genomeDir $INDEX --readFilesIn $i\_R1.fastq $i\_R2.fastq --soloType SmartSeq --readFilesManifest $MANIFEST --soloUMIdedup Exact --soloStrand Unstranded --outSAMtype BAM SortedByCoordinate --outFileNamePrefix $i

    rm *.fastq 

    cd ..

done
