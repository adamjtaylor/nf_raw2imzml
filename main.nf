#!/usr/bin/env nextflow
 
params.raw = '~/Documents/nf_testing/test.raw'
params.pat = '~/Documents/nf_testing/test.pat'
params.outdir = 'converted_imzmls'


process raw2imzml {

  publishDir "$params.outdir"
 input:
    val raw from params.raw
    val pat from params.pat


  output:
    path '*.imzML' into imzml_out
    path '*.ibd' into ibd_out

    
    """
    wget https://github.com/AlanRace/imzMLConverter/releases/download/2.1.0/jimzMLConverter-2.1.0.zip
    unzip jimzMLConverter-2.1.0.zip
    mv jimzMLConverter/target/* ./
    rm -r jimzMLConverter
    java -jar jimzMLConverter-2.1.0.jar imzML -p '$pat' '$raw'
    """
}
