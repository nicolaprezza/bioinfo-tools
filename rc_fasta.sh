#!/bin/bash

#reverse complement all sequences in input fasta files
#requires seqtk installed (https://github.com/lh3/seqtk)

seqtk seq -r $1 
