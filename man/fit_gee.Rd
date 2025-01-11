\name{fit_gee}
\alias{fit_gee}
\title{Estimate marginal effects with generalized estimating equations}
\usage{
fit_gee(data, formula, id, family, corstr)
}
\description{
Estimate marginal effects with generalized estimating equations. Data must be in long format.
}
\examples{
# Load repeated measures of adolescent tooth growth (must be of long format)
data <- read.csv("https://raw.githubusercontent.com/alejandroh3005/modelLong/main/data/ortho.csv")[-1]

# Define subject/cluster ID
id <- as.factor(data$Subject)

# Fit a GEE model of adolescent tooth growth from age and sex
mod_gee <- modelLong::fit_gee(
  data = data,
  formula = formula(distance ~ age + Sex),
  id = id,
  family = gaussian(),
  corstr = "independence")

# Fitted coefficients
coef(mod_gee$fit)

# Full model
mod_gee$fit
}
