#' Function to estimate marginal effects with generalized estimating equations
#'
#' @param data Data frame or list
#' @param formula Model formula (e.g., outcome ~ predictor)
#' @param id Character name of identification variable
#' @param family Distribution family of outcome (e.g., gaussian(), binomial())
#' @param corstr Correlation structure (e.g., "independence", "exchangeable", "ar1")
#'
#' @return List containing a GEE model fit from the data as a geepack object
#' @export
#'
#' @examples
fit_gee <- function(data, formula, id, family = gaussian(), corstr = "independence") {

  # Load relevant libraries
  library(geepack)

  # Verify arguments are provided and valid
  if (missing(data) || missing(formula) || missing(id)) {
    stop("Please provide 'data', 'formula', and 'id' arguments.")
  }
  stopifnot(typeof(corstr) == "character", typeof(data) == "list")

  # Fit the GEE model
  model <- geepack::geeglm(
    formula = formula,
    data = data,
    id = data[[id]],
    family = family,
    corstr = corstr)

  # Return the fitted model
  return(list(fit = model))
}
