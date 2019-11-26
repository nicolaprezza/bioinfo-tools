## count number of mismatches in sam file

cat $1 | grep -v ^'@' | cut -f 12 | cut -d':' -f 3 | awk '{ sum += $1 } END { print sum }'
