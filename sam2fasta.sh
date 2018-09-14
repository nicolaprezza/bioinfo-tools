#convert sam to fast. Name format: position_flag
if [[ $1 =~ \.gz$ ]]; then
	zcat $1 | grep -v ^@ | awk '{print ">"$4"_"$2"\n"$10}'
else
	cat $1 | grep -v ^@ | awk '{print ">"$4"_"$2"\n"$10}'
fi
