#' Load ChromHMM model
#'
#' @param model_file
#'          ChromHMM model file.
#'          This file usually starts with "model_" and ends with ".txt"
#' @param histone_order
#'          Specify the histone order. Example
#'          \code{c("H3K4me3", "H3K27ac", "H3K4me1", "H3K36me3",
#'                  "H3K9me3", "H3K27me3")}
#' @return Returns a list object.
#' \itemize{
#'  \item{"\code{num_states}"}{
#'    for the number of states in the model}
#'  \item{"\code{emissions}"}{
#'    for a dataframe with the emission probabilities}
#'  \item{"\code{transitions}"}{
#'    for a dataframe with the transition probabilities}
#' }
#' @examples
#' model_file <-
#'   system.file("extdata", "model_roadmap15.txt",
#'               package="hmmpick")
#' model_file <-
#'   system.file("extdata", "model_roadmap18.txt",
#'               package="hmmpick")
#'
#' load_chromhmm_model(model_file)
#'
#' @import readr
#' @export
load_chromhmm_model <- function(model_file, histone_order=NULL){
  ## Load data
  model <-
    suppressWarnings(
      readr::read_tsv(
        model_file,
        col_names = paste0("X", 1:6),
        col_types = readr::cols(.default = "c"),
        progress = FALSE)
    )

  num_states <- as.numeric(model[1,1])

  ## Extract transitions
  transitions <-
    model %>%
    filter(X1 == "transitionprobs") %>%
    select(
      from = X2,
      to = X3,
      prob = X4
    ) %>%
    mutate(
      prob = as.numeric(prob),
      from = factor(from, levels = 1:num_states),
      to = factor(to, levels = 1:num_states))

  ## Extract emissions
  emissions <-
    model %>%
    filter(
      X1 == "emissionprobs",
      X5 == "1"
    ) %>%
    select(
      state = X2,
      mark = X3,
      markname = X4,
      prob = X6
    ) %>%
    mutate(
      prob = as.numeric(prob),
      state = factor(state, levels = 1:num_states)
    )
  if (!is.null(histone_order)) {
    emissions$markname <-
      factor(emissions$markname, levels = histone_order)
  }

  list(
    "num_states" = num_states,
    "emissions" = emissions,
    "transitions" = transitions)
}
