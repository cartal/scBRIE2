#!/bin/bash -x
### Running the quant function of the BRIE2 tool

## SLURM setup

#SBATCH -o BRIE2_quant.out  #output file containing stdout
#SBATCH -e BRIE2_quant.log #output file containing stderr
#SBATCH -J BRIE2_quant #job name which you can see from squeue
#SBATCH -p normal_q #partition jobs is submitted to - dont change this
#SBATCH -c 8 #number of CPUs needed
#SBATCH --mem-per-cpu 64000 # memory needed in MB
#SBATCH --nodes=1
#SBATCH -t 120:00:00 # runtime needed in hh:mm:ss
#SBATCH --mail-user=monika.litvinukova@helmholtz-muenchen.de

### Set up working environment
wdir="/project/genomics/Litvinukova/experiments/isoform_project/BRIE2/"

CPU=8
GTF=/project/genomics/Litvinukova/data/ref_seq/BRIE2_annotations/mouse_GencodeM12/SE.gold.gtf
SAMPLES=/project/genomics/Litvinukova/data/mouse/liver/snRNAseq2_isoforms/test_samples.tsv
OUT=/project/genomics/Litvinukova/data/mouse/liver/snRNAseq2_isoforms/brie_output

### RUN BRIE-COUNT on all mapped samples

brie-count -a $GTF -S $SAMPLES -o $OUT -p $CPU

### Run Mode2-quant

brie-quant -i $OUT/brie_count.h5ad -o $OUT/brie_quant_aggr.h5ad --interceptMode gene --minCount=1 --minUniqCount=1 --minCell=1
