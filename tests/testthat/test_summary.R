context("Testing 'summary' function")

test_that("'summary' function returns a non-empty list", {
  rm(list = ls())
  library(modelLong)
  # Create a summary object
  data <- read.csv(
    "https://raw.githubusercontent.com/alejandroh3005/longitudinal-data/main/data/cdc-birthwt.csv")
  data <- data[c("border", "bweight", "mage")]
  data$"Low weight" <- as.factor(ifelse(data$bweight < 1200, 1, 0))
  summary_res <- modelLong::summary(data = data, group_var = "Low weight")

  # Verify that summary result is a non-empty list
  expect_true(is.list(summary_res))
  expect_true(length(summary_res) > 0)
})


test_that("Table 1 from 'summary' function is a non-empty list object", {
  rm(list = ls())
  library(modelLong)
  # Create a summary object
  data <- read.csv(
    "https://raw.githubusercontent.com/alejandroh3005/longitudinal-data/main/data/cdc-birthwt.csv")
  data <- data[c("border", "bweight", "mage")]
  data$"Low weight" <- as.factor(ifelse(data$bweight < 1200, 1, 0))
  summary_res <- modelLong::summary(data = data, group_var = "Low weight")

  # Verify that the Table 1 item is a non-empty list
  expect_true(is.list(summary_res$table1))
  expect_true(length(summary_res$table1) > 0)
})
