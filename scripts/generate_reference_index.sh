#!/bin/bash -x

#### SCRIPT TO GENERATE THE REFERENCE INDEX FOR STARsolo

### Computer set up

INDEX=/home/hpc/martinez/genomes/mm10/STARsolo/Gencode_M17_index/
FASTA=/home/hpc/martinez/genomes/mm10/GENCODEm17/GRCm38.fasta
GTF=/home/hpc/martinez/genomes/mm10/GENCODEm17/GRCm38.gtf

CPU=64

### Generate reference index

STAR --runMode genomeGenerate --runThreadN $CPU --genomeDir $INDEX --genomeFastaFiles $FASTA  --sjdbGTFfile $GTF
