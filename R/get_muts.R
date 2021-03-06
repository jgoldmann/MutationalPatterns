#' Retrieve base substitutions from vcf
#' 
#' A function to extract base substitutions of each position in vcf
#' @param vcf A CollapsedVCF object
#' @return Character vector with base substitutions
#' @import GenomicRanges
#' @export

get_muts = function(vcf) 
{
  ref = ref(vcf)
  alt = alt(vcf)
  multiple_alt_alleles = which(lapply(alt, function(x) length(x) > 1) == TRUE)
  if(length(multiple_alt_alleles > 0)){
    print(paste("Vcf contains", length(multiple_alt_alleles), "mutation(s) with multiple alternative alleles. These mutations were discarded."))
    ref = ref[-multiple_alt_alleles]
    alt = alt[-multiple_alt_alleles]
  }
  ref = as.character(ref)
  alt = as.character(unlist(alt))
  muts = paste(ref, alt, sep=">")
  return(muts)
}

