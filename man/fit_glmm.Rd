\name{fit_glmm}
\alias{fit_glmm}
\title{Estimate conditional effects with generalized linear mixed-effects models}
\usage{
fit_glmm(data, formula, family)
}
\description{
Estimate conditional effects with generalized linear mixed-effects models. Data must be in long format.
}
\examples{
# Load repeated measures of adolescent tooth growth (must be of long format)
data <- read.csv("https://raw.githubusercontent.com/alejandroh3005/modelLong/main/data/ortho.csv")[-1]

# Fit a GLMM model of adolescent tooth growth from age and sex
mod_glmm <- modelLong::fit_glmm(
  data = data,
  formula = formula(distance ~ age + Sex + (1 | Subject)),
  family = gaussian)

# Fitted coefficients
coef(mod_glmm$fit)

# Full model
mod_glmm$fit
}
