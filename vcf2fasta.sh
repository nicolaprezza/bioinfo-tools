# apply a VCF file to a fasta to obtain a mutated fasta
# usage: vcf2fasta mutations.vcf.gz input.fasta
# output to stdout

# vcf2fasta mutations.vcf.gz must be compressed with bgzip

#Index the new VCF file so it can be used by vcf-consensus
tabix -p vcf $1

#Run vcf-consensus
cat $2 | vcf-consensus $1
