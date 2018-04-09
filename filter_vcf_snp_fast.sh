# input: vcf.gz containing several individuals, individual number (1,2,3 ...)
# stdout: vcf of the individual with only SNPs and only one allele mutated (0|1 or 1|0)

# assumptions: the first 9 columns contain SNP info. The other columns are the individuals.

# filter_vcf.sh in.vcf.gz indiv_nr



nr=$2
col=$((9+nr))

#first part of header
zcat $1 | head -n 10000 | grep ^## > h1

#second part of header
zcat $1 | head -n 10000 | grep ^# | cut -f 1,2,3,4,5,6,7,8,9,$col > h2

zcat $1 | awk -v col=$col '(((col == "0|1") || (col == "1|0")) && (($4 == "A") || ($4 == "C") || ($4 == "G") || ($4 == "T")) && (($5 == "A") || ($5 == "C") || ($5 == "G") || ($5 == "T")))' | cut -f 1,2,3,4,5,6,7,8,9,$col
