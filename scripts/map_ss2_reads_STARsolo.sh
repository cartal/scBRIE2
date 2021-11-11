#!/bin/bash -x

### Map reads to GRCm38 using STARsolo. 

### Set up 

CPU=24
<<<<<<< HEAD
INDEX=/Volumes/TIGERII/nobackup/refseq/starindex/
READS=/Users/ctl/github/scBRIE2/data
MANIFEST=/Users/ctl/github/scBRIE2/data/manifest.tsv
=======
INDEX=/home/hpc/martinez/genomes/mm10/STARsolo/Gencode_M17_index/
READS=/home/hpc/martinez/00_projects/mouse/snRNAseq2_polyploidy_isoforms/snRNAseq2/
MANIFEST=/home/hpc/martinez/00_projects/mouse/snRNAseq2_polyploidy_isoforms/snRNAseq2/manifest.tsv
>>>>>>> 22b256bf36f2ce99fa678882c531ce69a19c11df

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
