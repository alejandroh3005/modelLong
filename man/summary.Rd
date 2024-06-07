\name{summary}
\alias{summary}
\title{Generate Table 1 summary by group}
\usage{
summary(data, group_var)
}
\description{
Generates a Table 1 style summary of data, with an option variable to stratify results. All generated tables will include overall summary statistics.
}
\examples{
data <- read.csv(
  "https://raw.githubusercontent.com/alejandroh3005/longitudinal-data/main/data/cdc-birthwt.csv")
data <- data[c("border", "bweight", "mage")]
data$"Low weight" <- as.factor(ifelse(data$bweight < 1200, 1, 0))
summary_res <- summary(data = data, group_var = "Low weight")
summary_res$table1
}

