#convert fastq to fasta (remove qualities)
cat $1 | awk 'NR%4==1 || NR%4==2' | tr '@' '>' 
