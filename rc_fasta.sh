#!/bin/bash

#reverse complement all sequences in input fasta files
#appends "_RC" to read names 

file=$1

while read line; do

	if [ `echo $line | grep -c "^>"` -eq 0 ]; then
		
		echo $line |rev | tr ACGT TGCA

	else
		printf ${line}"_RC\n"
	fi

done < $file
