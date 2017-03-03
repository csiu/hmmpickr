#' Load ChromHMM emission probabilities
#' @param filename The ChromHMM model emissions file
#' @param ... options for readr::read_tsv(...)
#' @export
load_chromhmm_emissions <- function(filename, ...) {
  emissions_probs <- readr::read_tsv(filename, progress=FALSE, ...)
  colnames(emissions_probs)[1] <- "state"
  tidyr::gather(emissions_probs, mark, prob, -state)
}
