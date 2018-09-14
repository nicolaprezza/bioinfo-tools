#convert sam to fastq. Name format: position_flag
if [[ $1 =~ \.gz$ ]]; then
	zcat $1 | grep -v ^@ | awk '{print "@"$4"_"$2"\n"$10"\n+\n"$11}'
else
	cat $1 | grep -v ^@ | awk '{print "@"$4"_"$2"\n"$10"\n+\n"$11}'
fi
