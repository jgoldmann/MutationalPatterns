% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_mut_context.R
\name{get_mut_context}
\alias{get_mut_context}
\title{Retrieve context of base substitutions}
\usage{
get_mut_context(vcf, ref_genome)
}
\arguments{
\item{vcf}{A CollapsedVCF object}

\item{ref_genome}{Reference genome}
}
\value{
Character vector the context of the base substitutions
}
\description{
A function to extract the bases 3' upstream and 5' downstream of the base substitutions
}

