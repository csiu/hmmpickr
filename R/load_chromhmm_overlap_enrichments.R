#' Load ChromHMM overlap enrichment file
#' @details Replaces the name of the first column with "state" and
#'          filters out the "Base" state.
#' @param enrichment_file
#'          ChormHMM model_*_emissions.txt file.
#'          The first column of the TSV should be chromatin state.
#' @param ... options for readr::read_tsv(...)
#' @export
load_chromhmm_overlap_enrichments <- function(enrichment_file, ...) {
  dat <- readr::read_tsv(enrichment_file, progress = FALSE, ...)
  colnames(dat)[1] <- "state"
  filter(dat, state != "Base")
}
