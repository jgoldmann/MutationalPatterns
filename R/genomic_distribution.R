#' Find overlaps between mutations and a genomic region
#' 
#' Function finds the number of mutations that reside in genomic region and takes surveyed area of genome into account
#' @param vcf_list A list...
#' @param region_list List with GRanges objects containing locations of genomic regions
#' @export


genomic_distribution = function(vcf_list, surveyed_list, region_list)
{
  if(!(length(vcf_list) == length(surveyed_list) )){stop("Vcf list and surveyed list must have the same length")}
  df = data.frame()
  # for each region j
  for(j in 1:length(region_list) )
  {
    print(paste("Region:", names(region_list)[j]))
    # for each sample i
    for(i in 1:length(vcf_list) )
    {
      print(paste("Sample:", names(vcf_list)[i]))
      res = intersect_with_region(vcf_list[[i]], surveyed_list[[i]], region_list[[j]])
      res$region = names(region_list)[j]
      res$sample = names(vcf_list)[i]
      res = res[,c(7,8,1:6)]
      df = rbind(df, res)
    }
  }
  # region as factor
  df$region = as.factor(df$region)
  # make sure order is the same as in region_list input (important for plotting later)
  levels(df$region) = names(region_list)
  return(df)
}