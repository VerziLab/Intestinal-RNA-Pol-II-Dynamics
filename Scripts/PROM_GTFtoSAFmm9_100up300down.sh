#!/usr/bin/env bash

#Generate an SAF file for TSS intervals from a GTF

#Specify some parameters
GTF=/mnt/rdrive/Verzi/Kiran/annotation/mm9.refGene.gtf
FA=/mnt/input/ref/Mus_musculus/UCSC/mm9/Sequence/WholeGenomeFasta/genome.fa
CHR=/home/namit/Informatics/mm9_chrom.sizes
TSS_UP=100
TSS_DOWN=300
FWD=tmp+
REV=tmp- 
SAF=PROM_mm9100up300down.saf


#Extract TSS coordinates for fwd strand genes
grep -w transcript $GTF | awk '$7=="+"' \
| cut -d '"' -f1,4 | cut -f1,4,5,9 | sed 's/gene_id "//'  \
| tr '"' '_' | awk '{OFS="\t"} {print $1,$2,$2+1,$4}' \
| bedtools slop -i - -g $CHR -l $TSS_UP -r $TSS_DOWN \
| awk '{OFS="\t"} {print $4,$1,$2,$3,"+"}' > $FWD

#Extract TSS coordinates for reverse strand genes
grep -w transcript $GTF | awk '$7!="+"' \
| cut -d '"' -f1,4 | cut -f1,4,5,9 | sed 's/gene_id "//' \
| tr '"' '_' | awk '{OFS="\t"} {print $1,$3-1,$3,$4}' \
| bedtools slop -i - -g $CHR -r $TSS_UP -l $TSS_DOWN \
| awk '{OFS="\t"} {print $4,$1,$2,$3,"-"}' > $REV

cat $FWD $REV > $SAF
rm $FWD $REV



