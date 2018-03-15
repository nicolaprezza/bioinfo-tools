#usage: split_fasta.sh input.fasta
#creates files in current directory

csplit -s -z $1 '/>/' '{*}'
for i in xx* ; do \
  n=$(sed 's/>// ; s/ .*// ; 1q' "$i") ; \
  mv "$i" "$n.fa" ; \
done
