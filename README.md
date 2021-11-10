# scBRIE2

### Repository for scRNA-Seq splice variant detection mapping using STARsolo and BRIE2

- The scripts to run the pipeline are inside `scripts`.

### Experimental Design

The data have been produced using the snRNA-seq2 protocol in the Martinez Lab at Helmholtz Pioneer Campus as previously described in https://www.nature.com/articles/s41467-021-24543-5. 
Briefly, single nuclei were isolated from young (3 months) and old (22 months) mice livers, divided based on ploidy and sorted into 384-well plates. The plates were processed with a  modified protocol and sequenced to saturation. Additional details can be found in the `metadata` file.

### Mapping using STARsolo

The index was build from Gencode M17 version of the mouse genome for compatibility with BRIE2 annotations.


