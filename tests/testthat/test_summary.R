context("Testing 'summary' function")

test_that("'summary' function returns a non-empty list", {
  rm(list = ls())
  library(modelLong)

  # Load repeated measures of adolescent tooth growth (must be of long format)
  data <- read.csv("https://raw.githubusercontent.com/alejandroh3005/modelLong/main/data/ortho.csv")[-1]

  # Summarize data
  summary_res <- modelLong::summary(data = data)

  # Verify that summary result is a non-empty list
  expect_true(is.list(summary_res))
  expect_true(length(summary_res) > 0)
})


test_that("Table 1 from 'summary' function is a non-empty list object", {
  rm(list = ls())
  library(modelLong)

  # Load repeated measures of adolescent tooth growth (must be of long format)
  data <- read.csv("https://raw.githubusercontent.com/alejandroh3005/modelLong/main/data/ortho.csv")[-1]

  # Summarize data, stratify by sex, and ensure age is encoded as continuous
  summary_res <- modelLong::summary(data = data)

  # Verify that the Table 1 item is a non-empty list
  expect_true(is.list(summary_res$table1))
  expect_true(length(summary_res$table1) > 0)
})
