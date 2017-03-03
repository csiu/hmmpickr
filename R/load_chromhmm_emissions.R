#' Load ChromHMM enrichment file
#' @details Replaces the name of the first column with "state" and
#'          filters out the "Base" state.
#' @param enrichment_file
#'          ChormHMM model_*_emissions.txt file.
#'          The first column of the TSV should be chromatin state.
#' @export
load_chromhmm_emissions <- function(enrichment_file) {
  dat <- readr::read_tsv(enrichment_file, progress = FALSE)
  colnames(dat)[1] <- "state"
  filter(dat, state != "Base")
}
