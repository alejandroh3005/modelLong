
# Purpose

This is a package for easy visualization and modeling of longitudinal data. Functions plot repeated measures and estimate autocorrelation, marginal effects with generalized estimating equations, and conditional effects with generalized linear mixed-effects models.

- The URL to the GitHub (i.e., the source code) is: https://github.com/alejandroh3005/modelLong
- The URL to the Pkgdown webpage is: https://alejandroh3005.github.io/modelLong

# How to install
This package is called `modelLong`. To install, run the following code (in R):

```R
library(devtools)
devtools::install_github("alejandroh3005/modelLong")
```

Upon completion, you can run the following code (in R):

```R
library(modelLong)
```

# Dependencies

The package depends on the following packages: `dplyr`, `ggplot2`, `gtsummary`, `lme4`, and `geepack`.

# Acknowledgements

Thank you to Dr. Kevin Lin for your kind instruction on building R public packages, and thanks to Dr. Gary Chen for teaching me methods to analyze longitudinal data.
