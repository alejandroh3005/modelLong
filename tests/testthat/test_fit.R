context("Testing 'fit' function")

test_that("'fit' function works", {
  rm(list = ls())
  library(modelLong)
  # Fit model of repeated measures
  data <- read.csv(
    "https://raw.githubusercontent.com/alejandroh3005/longitudinal-data/main/data/cdc-birthwt.csv")
  data$"Low weight" <- as.factor(ifelse(data$bweight < 1200, 1, 0))

  fit_res <- modelLong::fit()

  # Verify that fitting result is a non-empty list
  expect_true(is.list(fit_res))
  expect_true(length(fit_res) > 0)
})
