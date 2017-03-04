#' Calculate homogeneity cost
#' @param x Either the ChromHMM model file or
#'          emission probabilities loaded from
#'          \code{load_chromhmm_model(...)$emissions} or
#'          \code{load_chromhmm_emissions(...)}
#' @param is_model_file
#'          Boolean; TRUE if \code{x} is the model file and
#'          FALSE if \code{x} is emission probabilities.
#' @details Calculated by \code{D = sum[k=1 to K]{d_k}^2/K} where
#'          \code{d_k = sum[h=1 to H]{min(1-E_hk, E_hk)}}.
#' @examples
#' model_file <-
#'   system.file("extdata", "model_roadmap18.txt",
#'               package="hmmpick")
#'
#' homogeneity_cost(model_file)
#'
#' @export
homogeneity_cost <- function(x, is_model_file=TRUE) {
  if (is_model_file) {
    emissions <- load_chromhmm_model(x)$emissions
  }

  emissions_probs <-
    emissions %>%
    select(-markname) %>%
    tidyr::spread(mark, prob) %>%
    select(-state)

  d_k  <- apply(emissions_probs, 1, hmmpick:::hmmpick_cost_state)
  k <- length(d_k)
  sum(d_k^2)/k
}
