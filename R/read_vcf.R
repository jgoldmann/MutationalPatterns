#' Read vcf files into list of CollapsedVCF objects
#' 
#' Function reads Variant Call Format (VCF) files into a CollapsedVCF object and combines them in a list object
#' @param vcf_files Character vector of vcf file names
#' @param sample_names Character vector of sample names
#' @return List of CollapsedVCF objects
#' @export
#' @examples 
#' vcf_file_list = list.files("/your_vcf_dir/", full.names = T) 
#' vcf_list = read_vcf_list(vcf_files_list, sample_names)

read_vcf = function(vcf_files, sample_names)
{
  if(!(length(vcf_files) == length(sample_names))){stop("Provide the same number of sample names as vcf files")}
  vcf_list = list()
  for(i in 1:length(vcf_files))
  {
    vcf = readVcf(vcf_files[i], "-")
    # add "chr" to chromosomes if not there already
    if(length(grep("chr", seqlevels(vcf))) == 0){seqlevels(vcf) = paste('chr', seqlevels(vcf), sep = '')}
    vcf = list(vcf)
    names(vcf) = sample_names[i]
    vcf_list = c(vcf_list, vcf)
  }
  return(vcf_list)
}

