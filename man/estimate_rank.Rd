% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/estimate_rank.R
\name{estimate_rank}
\alias{estimate_rank}
\title{Estimate optimal rank for NMF decomposition}
\usage{
estimate_rank(mut_matrix, rank_range, nrun = 100)
}
\arguments{
\item{mut_matrix}{96 mutation count matrix}

\item{rank_range}{Range of ranks one would like to test}

\item{nrun}{Number of runs to perform, default=100}
}
\value{
NMF rank survey plot
}
\description{
Find optimal number of signatures for NMF decomposition
}

