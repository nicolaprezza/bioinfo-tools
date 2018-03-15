# input: vcf.gz containing several individuals, individual name
# stdout: vcf of the individual with only SNPs and only one allele mutated (0|1 or 1|0)

# filter_vcf.sh in.vcf.gz indiv_id

zcat $1 | vcf-subset -c $2 | awk '(/^#/ ) || ((($10 == "0|1") || ($10 == "1|0")) && (($4 == "A") || ($4 == "C") || ($4 == "G") || ($4 == "T")) && (($5 == "A") || ($5 == "C") || ($5 == "G") || ($5 == "T")))'
