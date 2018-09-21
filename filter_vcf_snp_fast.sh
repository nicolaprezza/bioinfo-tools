# input: vcf.gz containing several individuals and column number containing  individual of interest
# stdout: vcf of the individual

# assumptions: the first 9 columns contain SNP info. The other columns are the individuals.

# filter_vcf.sh in.vcf.gz col_nr



nr=$2
col=$nr

#header
zcat $1 | head -n 10000 | grep ^# | cut -f 1,2,3,4,5,6,7,8,9,$col > h

zcat $1 | awk -v col=$col '(($col == "0|1") || ($col == "1|0") || ($col == "1|1"))' | cut -f 1,2,3,4,5,6,7,8,9,$col > body

cat h body

rm h body
