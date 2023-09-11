#!/usr/bin/env bash
#Generate an SAF file for TSS intervals from a GTF

#Specify some parameters
GTF=/mnt/rdrive/Verzi/Kiran/annotation/mm9.refGene.gtf
FA=/mnt/input/ref/Mus_musculus/UCSC/mm9/Sequence/WholeGenomeFasta/genome.fa
CHR=/home/namit/Informatics/mm9_chrom.sizes
FWD=tmp+
REV=tmp- 
SAF=GB_mm9350+t0-500TES.saf


#Extract TSS coordinates for fwd strand genes
grep -w transcript $GTF | awk '$7=="+"' \
| cut -d '"' -f1,4 | cut -f1,4,5,9 | sed 's/gene_id "//'  \
| tr '"' '_' | awk '{OFS="\t"} {print $1,$2+350,$3-500,$4}' \
| awk '{OFS="\t"} {print $4,$1,$2,$3,"+"}' > $FWD

#Extract TSS coordinates for reverse strand genes
grep -w transcript $GTF | awk '$7!="+"' \
| cut -d '"' -f1,4 | cut -f1,4,5,9 | sed 's/gene_id "//' \
| tr '"' '_' | awk '{OFS="\t"} {print $1,$2-500,$3+350,$4}' \
| awk '{OFS="\t"} {print $4,$1,$2,$3,"-"}' > $REV

cat $FWD $REV > $SAF
rm $FWD $REV




