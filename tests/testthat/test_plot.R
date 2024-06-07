context("Testing 'plot' function")

test_that("'plot' function returns a non-empty list", {
  rm(list = ls())
  library(modelLong)
  # Plot repeated measures and ACF
  data <- read.csv(
    "https://raw.githubusercontent.com/alejandroh3005/longitudinal-data/main/data/cdc-birthwt.csv")
  data$"Low weight" <- as.factor(ifelse(data$bweight < 1200, 1, 0))

  plot_res <- modelLong::plot(data = data,
                   outcome = "bweight",
                   time = "mage",
                   id = "mid",
                   col_group = "Low weight")

  # Verify that summary result is a non-empty list
  expect_true(is.list(plot_res))
  expect_true(length(plot_res) > 0)
})


test_that("'plot' function returns two valid GGPlot objects", {
  rm(list = ls())
  library(modelLong)
  # Plot repeated measures and ACF
  data <- read.csv(
    "https://raw.githubusercontent.com/alejandroh3005/longitudinal-data/main/data/cdc-birthwt.csv")
  data$"Low weight" <- as.factor(ifelse(data$bweight < 1200, 1, 0))

  plot_res <- plot(data = data,
                   outcome = "bweight",
                   time = "mage",
                   id = "mid",
                   col_group = "Low weight")


  # Verify that returned items are valid GGPlot objects
  expect_true(all(c("data", "mapping", "layers") %in% names(plot_res$data_plot)))
  expect_true(all(c("data", "mapping", "layers") %in% names(plot_res$acf_plot)))
})
