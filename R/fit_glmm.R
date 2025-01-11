#' Function to estimate conditional effects with generalized linear mixed-effects models
#'
#' @param data Data frame or list
#' @param formula Model formula (e.g., outcome ~ predictor + (1 | subject))
#' @param family Distribution family of outcome (e.g., gaussian(), binomial())
#'
#' @return List containing a GLMM model fit from the data as a lme4 object
#' @export
#'
#' @examples
fit_glmm <- function(data, formula, family = gaussian()) {

  # Load relevant libraries
  library(lme4)

  # Verify arguments are provided and valid
  if (missing(data) || missing(formula) || missing(family)) {
    stop("Please provide 'data', 'formula', and 'family' arguments.")
  }
  stopifnot(typeof(data) == "list")

  # Fit the GLMM
  model <- lme4::glmer(
    formula = formula,
    data = data,
    family = family)

  # Return the fitted model
  return(list(fit = model))
}
