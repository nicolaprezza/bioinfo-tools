#input: 
# - main VCF with mutations from a set of individuals (ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502)
# - individual ID (e.g. HG00100)
# - original FASTA file (for the data above: ftp://ftp.1000genomes.ebi.ac.uk//vol1/ftp/technical/reference/phase2_reference_assembly_sequence/hs37d5.fa.gz)

#output 

# - VCF of the individual, filtered to keep only SNPs
# - mutated FASTA of individual

# usage: pipeline_indiv.sh in_vcf.vcf.gz ID orig.fasta vcf_out.vcf fasta_out.fasta

in_vcf=$1
ID=$2
in_fasta=$3
out_vcf=$4
out_fasta=$5

filter_vcf_snp.sh ${in_vcf} ${ID} > ${out_vcf}

bgzip ${out_vcf}

vcf2fasta.sh ${out_vcf}.gz ${in_fasta} > ${out_fasta}
