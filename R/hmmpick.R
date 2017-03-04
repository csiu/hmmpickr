#' Given a list of model files, chooses the best model
#' @param model_files List of ChromHMM model files to choose from
#' @format Returns a list sorted by ascending homogeneity cost.
#'         The models are used as element names, and the
#'         homogeneity cost are used as element values.
#' @seealso \code{\link{homogeneity_cost}} for the calculation of the
#'          homogeneity cost.
#' @examples
#' model_files <- c(
#'   system.file("extdata", "model_roadmap15.txt",
#'               package="hmmpickr"),
#'   system.file("extdata", "model_roadmap18.txt",
#'               package="hmmpickr")
#' )
#' hmmpick(model_files)
#' @import dplyr
#' @export
hmmpick <- function(model_files) {
  sort(sapply(model_files, hmmpickr::homogeneity_cost))
}
