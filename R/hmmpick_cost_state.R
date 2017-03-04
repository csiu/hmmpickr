#' Cost of a state
#' @param state_emissions list of state emissions
#' @details State cost calculated by
#'          \code{d_k = sum[h=1 to H]{min(1-E_hk, E_hk)}}
# state_emissions <- c(0.25, 0.5)
# hmmpick:::hmmpick_cost_state(state_emissions)
hmmpick_cost_state <- function(state_emissions){
  sum(sapply(state_emissions, function(e){min(1-e, e)}))
}

#  ------------------------------------------------------------------------
#' Helper to calculate the cost of the different states
#' (used for development)
#' @param emissions_probs
#'          matrix (row=state; col=mark) containing the state emissions.
#' @param scale
#'          float/int or list (length should be equal to the number of rows in
#'          \code{emissions_probs}) used to scale the states.
#'          By default, no scaling is applied.
#' @param returntotal
#'          boolean; TRUE to return the average model cost or
#'          FALSE to return the list of state costs.
#' @examples
#' emissions_probs <- rbind(c(1, 0.5), c(1,0))
#' scale <- c(.95, .05)
#' hmmpick:::hmmpick_cost_states(emissions_probs, scale)
hmmpick_cost_states <- function(emissions_probs, scale=1, returntotal=TRUE){
  d_k  <- apply(emissions_probs, 1, hmmpick:::hmmpick_cost_state) * scale
  if (returntotal) sum(d_k) else d_k
}
