#!/usr/bin/env nextflow
 
params.raw = '~/Documents/nf_testing/test.raw'
params.pat = '~/Documents/nf_testing/test.pat'
params.outdir = 'converted_imzmls'
 

process raw2imzml {

  publishDir "$params.outdir"

 input:
    path raw from params.raw
    path pat from params.pat


  output:
    path '*.imzML' into imzml_out
    path '*.ibd' into ibd_out

    
    """
    java -jar /home/adamtaylor/jimzMLConverter/target/jimzMLConverter-2.1.0.jar imzML -p $pat $raw
    """
}
