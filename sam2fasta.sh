#convert sam to fast. Name format: position_flag
cat $1 | grep -v ^@ | awk '{print ">"$4"_"$2"\n"$10}'
