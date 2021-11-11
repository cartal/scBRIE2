#!/bin/bash -x

#### SCRIPT TO GENERATE THE REFERENCE INDEX FOR STARsolo

### Computer set up

INDEX=/Volumes/TIGERII/nobackup/refseq/starindex
FASTA=/Volumes/TIGERII/nobackup/refseq/fasta/GRCm38.fasta
GTF=/Volumes/TIGERII/nobackup/refseq/gtf/GRCm38.gtf

CPU=3

### Generate reference index

STAR --runMode genomeGenerate --runThreadN $CPU --genomeDir $INDEX --genomeFastaFiles $FASTA  --sjdbGTFfile $GTF
