#!/bin/bash -x

#### SCRIPT TO GENERATE THE REFERENCE INDEX FOR STARsolo

### Computer set up

INDEX=/Volumes/pinquisitor/experiments/data/ref_seq/GencodeM17
FASTA=/Volumes/pinquisitor/experiments/data/ref_seq/GencodeM17/GRCm38.fasta
GTF=/Volumes/pinquisitor/experiments/data/ref_seq/GencodeM17/GRCm38.gtf

CPU=3

### Generate reference index

STAR --runMode genomeGenerate --runThreadN $CPU --genomeDir $INDEX --genomeFastaFiles $FASTA  --sjdbGTFfile $GTF
