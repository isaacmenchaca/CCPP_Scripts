#!/bin/bash

#use grep in order to filter BLAST results

FILE_NAME="Trinity_T519" #insert name of file FIXME: possibly stream names of files for automation
BLAST_RESULTS_FILE=${FILE_NAME}.txt


grep -i "virus" $BLAST_RESULTS_FILE > ${FILE_NAME}_filtered.txt
grep -i	"virus"	$BLAST_RESULTS_FILE > ${FILE_NAME}_virus_file.txt

grep -i	"viroid" $BLAST_RESULTS_FILE >> ${FILE_NAME}_filtered.txt
grep -i "viroid" $BLAST_RESULTS_FILE > ${FILE_NAME}_viroid_file.txt

grep -i "spiroplasma" $BLAST_RESULTS_FILE >> ${FILE_NAME}_filtered.txt 
grep -i "spiroplasma" $BLAST_RESULTS_FILE > ${FILE_NAME}_spiroplasma_file.txt

grep -i "xylella" $BLAST_RESULTS_FILE >> ${FILE_NAME}_filtered.txt
grep -i "xylella" $BLAST_RESULTS_FILE > ${FILE_NAME}_xylella_file.txt

grep -i "liberibacter" $BLAST_RESULTS_FILE >> ${FILE_NAME}_filtered.txt
grep -i "liberibacter" $BLAST_RESULTS_FILE > ${FILE_NAME}_liberibacter_file.txt

grep -i "phytoplasma" $BLAST_RESULTS_FILE >> ${FILE_NAME}_filtered.txt
grep -i "phytoplasma" $BLAST_RESULTS_FILE > ${FILE_NAME}_phytoplasma_file.txt

mkdir ${FILE_NAME} | mv *${FILE_NAME}* ${FILE_NAME}/

echo "End of script" > ${FILE_NAME}_FINISHED.txt
