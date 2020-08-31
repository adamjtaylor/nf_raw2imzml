#!/usr/bin/env nextflow
 
params.raw = '~/Documents/nf_testing/test.raw'
params.pat = '~/Documents/nf_testing/test.pat'
params.outdir = 'converted_imzmls'

raw_win =${params.raw//\//\\\\}
pat_win =${params.pat//\//\\\\}


process raw2imzml {

  publishDir "$params.outdir"

 input:
    val raw from raw_win
    val pat from pat_win


  output:
    path '*.imzML' into imzml_out
    path '*.ibd' into ibd_out

    
    """
    java -jar /home/adamtaylor/jimzMLConverter/target/jimzMLConverter-2.1.0.jar imzML -p '$pat_win' '$raw_win'
    """
}
