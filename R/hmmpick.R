#' Pick the ChromHMM model that is most well-defined
#' @param model_files A list of ChromHMM models
#' @param full_path Boolean; TRUE to return the full model path in the output,
#'                  or FALSE to return only the model basename.
#' @format Returns a list sorted by ascending homogeneity cost.
#'         The models in \code{model_files} are used as the element names, and
#'         the model homogeneity cost are used as the element values.
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
hmmpick <- function(model_files, full_path=FALSE) {
  output <- sapply(model_files, hmmpickr::homogeneity_cost)
  if (!full_path) names(output) <- basename(names(output))
  sort(output)
}
