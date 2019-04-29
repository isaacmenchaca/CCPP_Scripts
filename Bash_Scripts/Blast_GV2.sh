#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1G
#SBATCH --mem=100G
#SBATCH --mail-user=imenc001@ucr.edu
#SBATCH --mail-type=ALL
#SBATCH --job-name="BLAST"
#SBATCH -p intel 

#load blast module 2.2.30(default)
module load ncbi-blast

#load ncbi data base (update 20170707)
module load db-ncbi

#see what available databases are on the cluster (20170707)
module avail db-ncbi

blastn -db $NCBI_DB/nt -query ~/Imenc001/Trinity.Fasta_files/Trinity_T519.fasta -out ~/Imenc001/Trinity.Fasta_files/BLAST_Files/Trinity_T519.txt  -outfmt "7 qseqid sseqid sallseqid staxid stitle pident nident length mismatch qstart qend sstart send evalue bitscore"

echo "Finished Blast for Trinity_T519" > ~/Imenc001/Trinity.Fasta_files/BLAST_Files/Blast_Finish_Trinity_T519.txt

