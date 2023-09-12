# Intestinal-RNA-Pol-II-Dynamics

This repository provides code used in the analysis from PAPER??. Scripts include those used for partitoning read counts, for metagene analysis, differential analysis and other miscellaneous analysis. 

## Project Outline
- [Scripts](./Scripts) - Scripts generated during the course of this project
- [Data](./Data) - Raw data the above scripts were used on to perform the analyses
 
##  Scripts 
The following scripts were custom generated for performing the analysis in this paper. Brief description of each script is given below:

- <PROM_GTFtoSAFmm9_100up300down.sh> - Generation of Pol II ChIP read counts in the promoter-proximal region
- <GB_GTFtoSAFmm9_350%2Bto-500TES.sh> - Generation of Pol II ChIP read counts in the gene body region
- <filter_lessthan1000_gene_length.py> - Python script to remove genes of size less than 1kb
- <filter_gene_within_1kb.py> - Python script to remove genes within 1 kb of eachother
- <differential_analysis_pol2counts.Rmd> - Script to run differential analysis between read counts from each cell type
- <Metagene-plots-from-Deeptools-tab.Rmd> - Rscript to generate the metagene plots shown in the manuscript
- <qudrantplots_l2FC.Rmd> - Rscript to generate quadrant plots shown in the manuscript
- <sushiplots.Rmd> - Rscript to generate looping diagrams shown in the manuscript

