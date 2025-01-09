context("Testing 'plot' function")

test_that("'plot' function returns a non-empty list", {
  rm(list = ls())
  library(modelLong)

  # Load repeated measures of adolescent tooth growth (must be of long format)
  data <- read.csv("https://raw.githubusercontent.com/alejandroh3005/modelLong/main/data/ortho.csv")[-1]

  # Plot the repeated measures and autocorrelation
  plot_res <- modelLong::plot(
    data = data,
    outcome = "distance",
    time = "age",
    id = "Subject")

  # Verify that summary result is a non-empty list
  expect_true(is.list(plot_res))
  expect_true(length(plot_res) > 0)
})


test_that("'plot' function returns two valid ggplot objects", {
  rm(list = ls())
  library(modelLong)

  # Load repeated measures of adolescent tooth growth (must be of long format)
  data <- read.csv("https://raw.githubusercontent.com/alejandroh3005/modelLong/main/data/ortho.csv")[-1]

  # Plot the repeated measures and autocorrelation
  plot_res <- modelLong::plot(
    data = data,
    outcome = "distance",
    time = "age",
    id = "Subject")

  # Verify that returned items are valid ggplot objects (crude method)
  expect_true(all(c("data", "mapping", "layers") %in% names(plot_res$data_plot)))
  expect_true(all(c("data", "mapping", "layers") %in% names(plot_res$acf_plot)))
})
