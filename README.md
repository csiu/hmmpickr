
[![DOI](https://zenodo.org/badge/83733732.svg)](https://zenodo.org/badge/latestdoi/83733732)

hmmpickr
========

Overview
--------

ChromHMM (Ernst & Kellis, 2012), an implementation of a hidden Markov model (HMM), uses epigenetic features such as histone modifications to represent observed (or output) states and unobserved (or hidden) states to represent chromatin states. Due to the nature of hidden states, the number of states will need to be specified programmatically and oftentimes numerous candidate models are generated. The goal of hmmpickr is to quantitatively help pick the model whose states are the most well-defined.

Installation
------------

``` r
# install.packages("devtools")
devtools::install_github("csiu/hmmpickr")
```

Getting started
---------------

``` r
library(hmmpickr)

# List of ChromHMM models
model_files <- c(
  system.file("extdata", "model_roadmap15.txt", package="hmmpickr"),
  system.file("extdata", "model_roadmap18.txt", package="hmmpickr"))

# Calculate homogeneity cost
hmmpick(model_files, full_path = FALSE)
#> model_roadmap15.txt model_roadmap18.txt 
#>           0.2011149           0.2254282
```

The list output of `hmmpick()` is sorted by ascending homogeneity cost. Therefore, the model in the first position is the model whose states are the most well-defined.

Acknowledgement
---------------

-   Model files are downloaded from (Roadmap Epigenomics Consortium, et al., 2015)
