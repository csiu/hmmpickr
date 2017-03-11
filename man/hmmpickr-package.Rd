\name{hmmpickr-package}
\alias{hmmpickr-package}
\alias{hmmpickr}
\docType{package}
\title{
\packageTitle{hmmpickr}
}
\description{
\packageDescription{hmmpickr}
}
\details{
ChromHMM (Ernst & Kellis, 2012), an implementation of a hidden Markov model (HMM), uses epigenetic features such as histone modifications to represent observed (or output) states and unobserved (or hidden) states to represent chromatin states. Due to the nature of hidden states, the number of states will need to be specified programmatically and oftentimes numerous candidate models are generated. The goal of hmmpickr is to help pick the model whose states are the most well-defined.
}
\author{
\packageAuthor{hmmpickr}

Maintainer: \packageMaintainer{hmmpickr}
}

\examples{
library(hmmpickr)

# List of ChromHMM models
model_files <- c(
  system.file("extdata", "model_roadmap15.txt", package="hmmpickr"),
  system.file("extdata", "model_roadmap18.txt", package="hmmpickr"))

# Calculate homogeneity cost
hmmpick(model_files, full_path = FALSE)
}
