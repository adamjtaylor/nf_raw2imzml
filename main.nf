#!/usr/bin/env nextflow
 
params.raw = '~/Documents/nf_testing/test.raw'
params.pat = '~/Documents/nf_testing/test.pat'
params.outdir = 'converted_imzmls'


process raw2imzml {

  publishDir "$params.outdir"
  container 'imzmlconverter-docker'
 input:
    val raw from params.raw
    val pat from params.pat


  output:
    path '*.imzML' into imzml_out
    path '*.ibd' into ibd_out

    
    """
    jimzMLconverter imzML -p '$pat' '$raw'
    """
}
