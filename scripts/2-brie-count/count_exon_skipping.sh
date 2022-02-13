#!/bin/bash -x

### Set up working environment

CPU=3
GTF=/Volumes/TIGERII/nobackup/refseq/brie2_gtfs/SE.gold.gtf
SAMPLES=samples.tsv
OUT=test

### RUN BRIE-COUNT on all mapped samples

brie-count -a $GTF -S $SAMPLES -o $OUT -p $CPU

### Run Mode2-quant

brie-quant -i $OUT/brie_count.h5ad -o $OUT/brie_quant_aggr.h5ad --interceptMode gene --minCount=2 --minUniqCount=2 --minCell=2

### Run Mode2-diff

#brie-quant -i $OUT/brie_count.h5ad -o $OUT/brie_quant_cell.h5ad -c $DATA_DIR/cell_info.tsv --interceptMode gene --LRTindex=All
