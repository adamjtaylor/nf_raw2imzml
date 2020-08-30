  
#!/usr/bin/env nextflow
 
params.raw = '~/Documents/nf_testing/test.raw'
params.pat = '~/Documents/nf_testing/test.pat'
params.outdir = 'converted_imzmls'
 

process sa_auto {

  publishDir "$params.outdir"

 input:
    val raw from params.raw
    val pat from params.pat


  output:
    file '*.imzML' into records
    file '*.ibd' into records

    
    """
    wget https://github.com/AlanRace/imzMLConverter/releases/download/2.1.0/jimzMLConverter-2.1.0.zip
    unzip jimzMLConverter-2.1.0.zip
    cd jimzMLConverter/target
    java -jar jimzMLConverter-2.1.0.jar imzML -p $pat $raw
    """
}
