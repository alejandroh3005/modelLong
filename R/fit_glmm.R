#' Function to estimate conditional effects with generalized linear mixed-effects models
#'
#' @param data Data frame or list
#' @param formula Model formula (e.g., outcome ~ predictor)
#' @param random_effects Random effects structure (e.g., ~ 1 | Subject)
#' @param family Distribution family of outcome (e.g., gaussian(), binomial())
#'
#' @return List containing a GLMM model fit from the data as a lme4 object
#' @export
#'
#' @examples
fit_glmm <- function(data, formula, random_effects, family = gaussian()) {

  # Verify arguments are provided and valid
  if (missing(data) || missing(formula) || missing(random_effects)) {
    stop("Please provide 'data', 'formula', and 'random_effects' arguments.")
  }
  stopifnot(typeof(data) == "list")

  # Load relevant libraries
  library(lme4)

  # Verify arguments are provided and valid
  if (missing(data) || missing(formula) || missing(id)) {
    stop("Please provide 'data', 'formula', and 'id' arguments.")
  }
  stopifnot(typeof(corstr) == "character", typeof(data) == "list")

  # Fit the GLMM
  model <- lme4::glmer(
    fixed = formula,
    random = random_effects,
    data = data,
    method = method)

  # Return the fitted model
  return(list(fit = model))
}
